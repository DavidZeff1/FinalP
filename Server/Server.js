const express = require("express");
const multer = require("multer");
const storage = multer.memoryStorage();
const upload = multer({ storage });
const path = require("path");
const cors = require("cors");
const pdfParse = require("pdf-parse");
const OpenAI = require("openai");
const app = express();
require("dotenv").config();
const { createConnectionFunc } = require("./mySQLdbAdmin");
const { findPrerequisiteMap } = require("./preReqCalculator");
const PORT = process.env.PORT || 5000;
const { addDays, format } = require("date-fns");
const {
  initializeClassifier,
  classifyFlashCard,
} = require("../Server/conceptRelationshipLearningModel/model");

(async () => {
  await initializeClassifier();
})();

const openai = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY,
});

app.use(
  cors({
    origin: "http://localhost:3000",
    methods: ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
    allowedHeaders: ["Content-Type"],
  })
);
app.use(express.json({ extended: true, limit: "50mb" }));
app.use(express.urlencoded({ extended: true, limit: "50mb" }));
app.use("/uploads", express.static(path.join(__dirname, "uploads")));

app.post("/handleGameFile", upload.single("file"), async (req, res) => {
  try {
    const parsedPdfData = await parsePdfFileBuffer(req.file.buffer);

    const questionAnswerPrompt = `Generate question–answer pairs based on the following text:
${parsedPdfData.text}

- Separate each question–answer pair with a '$' character.
- Separate the question from its answer with a '@' character.
- Do NOT include any newlines or extra text; just the raw pairs.`;

    const aiResponse = await openAIResponse(questionAnswerPrompt);
    const raw = aiResponse.choices[0].message.content.trim();

    const result = parseQA(raw);

    res.json({ result });
  } catch (err) {
    console.error("Error in handleGameFile:", err);
    res.status(500).json({ error: "Internal server error" });
  }
});

app.put("/handleUnityGameFile", upload.single("file"), async (req, res) => {
  const pdfData = await parsePdfFileBuffer(req.file.buffer);

  const prompt =
    "Generate five multiple-choice questions (A, B, C only, one correct). " +
    pdfData.text;

  const aiResp = await openAIResponse(prompt);
  const rawText = aiResp.choices[0].message.content;
  console.log(aiResp.choices[0].message.content);
  const mcqArr = parseMCQSet(rawText);
  console.log(mcqArr);
  await HandleQuizSetInsertion(mcqArr, "Biology");
  res.json({ inserted: mcqArr.length });
});

app.post("/handleSummarizeFile", upload.single("file"), async (req, res) => {
  const parsedPdfData = await parsePdfFileBuffer(req.file.buffer);
  const prompt = `Summarize the following text in detail, and return _only_ the formatted summary using these exact delimiters:

1. **Document title** prefixed with @  
2. **Sections** separated by %  
3. **Section titles** prefixed with #  
4. **Bullet points** prefixed with +

Formatting rules (no extra whitespace or text):
- Start the entire output with @Title (no spaces around @).  
- After the title, immediately put % to begin the first section.  
- Within each section:  
  - Begin with #SectionTitle (no spaces around #).  
  - For each bullet under that section, prefix with +BulletText (no spaces after +).  
- After the last bullet of a section, put % before the next #SectionTitle (or end output).  
- Do not include any Markdown, code fences, JSON brackets, newlines except to separate bullets or sections as needed.  
- Return exactly the summary text—no explanations, no “Here is your summary,” no extra blank lines.

Here’s the text to summarize:
${parsedPdfData.text}
`;

  const aiResponse = await openAIResponse(prompt);
  console.log(aiResponse.choices[0].message.content);
  res.json({ result: aiResponse.choices[0].message.content });
});

app.post("/handleFlashCardFile", upload.single("file"), async (req, res) => {
  try {
    const { text } = await parsePdfFileBuffer(req.file.buffer);

    const csPrompt = `
You’re given a text excerpt from a single topic of an academic course.

Your task:
1) Identify the most likely course title.
2) Construct a realistic, real-world syllabus for that course, divided into weekly modules.

Output **only** in this exact format (no extra text):
\`\`\`
<COURSE_NAME>%W1T1@W1T2@…$W2T1@W2T2@…$…$W12T1@W12T2@…
\`\`\`
- Use **%** immediately after the course name.  
- Use **$** to separate each week’s block.  
- Within each week, use **@** to separate topics.  

Example:
\`\`\`
Introduction to Biology%Cell Structure@Membrane Transport$Metabolism@Enzymes$…$Genetics@Biotechnology
\`\`\`

Here is the excerpt:
\`\`\`
${text}
\`\`\`
`;
    const qaPrompt = `Generate question–answer pairs based on the following text:
    ${text}.
    between every question answer pair there should be a '$' symbol
    and between every question and answer there should be a @, this is for parsing purposes
    also make sure theres no new lines and no leading or ending spaces , just the relevant text with the seperators`;

    const [csResp, qaResp] = await Promise.all([
      openAIResponse(csPrompt),
      openAIResponse(qaPrompt),
    ]);

    const syllabusOutput = csResp.choices[0].message.content.trim();
    const qaOutput = qaResp.choices[0].message.content.trim();

    const courseId = await ParseCourseAndSyllabusFunc(syllabusOutput);
    const flashCardSetId = await createFlashCardSet(courseId);

    const flashCards = parseFlashCards(qaOutput);

    const inserted = await insertFlashCardsIntoDB(
      flashCards,
      flashCardSetId,
      courseId
    );

    const sample = inserted[0];
    const predictedCourse = classifyFlashCard({
      concept: sample.question,
      summary: sample.answer,
    });
    console.log(`Classifier thinks this card belongs to: ${predictedCourse}`);

    syncAllPrerequisites().catch((err) =>
      console.error("Prereq sync failed:", err)
    );

    res.json({ flashCardSetId, flashCards: inserted });
  } catch (err) {
    console.error("Error in handleFlashCardFile:", err);
    res.status(500).json({ error: "Internal server error" });
  }
});

async function ParseCourseAndSyllabusFunc(responseText) {
  const [courseTitle, syllabusStr] = responseText.split("%");
  const weeks = syllabusStr.split("$");
  const conn = await createConnectionFunc();

  const [existing] = await conn.execute(
    `SELECT id FROM courses WHERE title = ?`,
    [courseTitle]
  );
  let courseId;
  if (existing.length) {
    courseId = existing[0].id;
    await conn.end();
    return courseId;
  }

  const [res] = await conn.execute(`INSERT INTO courses (title) VALUES (?)`, [
    courseTitle,
  ]);
  courseId = res.insertId;

  const rows = [];
  weeks.forEach((weekStr, idx) => {
    const wn = idx + 1;
    weekStr
      .split("@")
      .map((t) => t.trim())
      .filter(Boolean)
      .forEach((topic) => rows.push([courseId, wn, topic]));
  });
  if (rows.length) {
    await conn.query(
      `INSERT INTO course_syllabus (course_id, week_number, topic) VALUES ?`,
      [rows]
    );
  }

  await conn.end();
  return courseId;
}

app.post("/handleTestFile", upload.single("file"), async (req, res) => {
  const parsedPdfData = await parsePdfFileBuffer(req.file.buffer);
  const promt =
    "The following are is part of a question from an exam < begining of question > " +
    parsedPdfData.text +
    "< end of question > please generate a simlar question to that";
  const aiResponse = await openAIResponse(promt);

  console.log(aiResponse.choices[0].message.content);

  res.json({ result: aiResponse.choices[0].message.content });
});

app.get("/api/courses", async (req, res) => {
  const conn = await createConnectionFunc();
  try {
    const [rows] = await conn.query(
      `SELECT id, title FROM courses ORDER BY title`
    );
    res.json(rows);
  } catch (err) {
    console.error("Error fetching courses:", err);
    res.status(500).json({ error: "Internal server error" });
  } finally {
    await conn.end();
  }
});

app.get("/api/courses/:courseId/flashcards", async (req, res) => {
  const { courseId } = req.params;
  const conn = await createConnectionFunc();
  try {
    const [rows] = await conn.query(
      `
      SELECT
        fc.idflash_card AS id,
        fc.concept      AS question,
        fc.summary      AS answer
      FROM flash_card fc
      JOIN flash_card_set fcs
        ON fc.idflash_card_set = fcs.idflash_card_set
      WHERE fcs.course_id = ?
      `,
      [courseId]
    );
    res.json(rows);
  } catch (err) {
    console.error("Error fetching flashcards:", err);
    res.status(500).json({ error: "Internal server error" });
  } finally {
    await conn.end();
  }
});

async function openAIResponse(promt) {
  const Response = await openai.chat.completions.create({
    model: "o4-mini-2025-04-16",
    messages: [
      {
        role: "user",
        content: promt,
      },
    ],
  });
  return Response;
}

async function parsePdfFileBuffer(pdfBuffer) {
  const parsedPdf = await pdfParse(pdfBuffer);
  return parsedPdf;
}

async function parseFlashCardSet(text, courseId) {
  const conn = await createConnectionFunc();
  const [
    ,
    main_topic,
    subtopic_1,
    importance_1,
    subtopic_2,
    importance_2,
    subtopic_3,
    importance_3,
  ] = text.split("$").map((s) => s.trim());

  const [result] = await conn.execute(
    `INSERT INTO flash_card_set 
       (course_id, main_topic, subtopic_1, importance_1,
        subtopic_2, importance_2, subtopic_3, importance_3)
     VALUES (?, ?, ?, ?, ?, ?, ?, ?)`,
    [
      courseId,
      main_topic,
      subtopic_1,
      importance_1,
      subtopic_2,
      importance_2,
      subtopic_3,
      importance_3,
    ]
  );
  await conn.end();
  return result.insertId;
}

function parseFlashCards(text) {
  return text
    .split("$")
    .map((item) => item.split("@").map((s) => s.trim()))
    .filter(([q, a]) => q && a);
}

async function insertFlashCardsIntoDB(flashCards, flashCardSetId, courseId) {
  const conn = await createConnectionFunc();
  const inserted = [];

  for (const [question, answer] of flashCards) {
    const syllabusId = await classifySyllabusTopic(question, answer, courseId);

    const [res] = await conn.execute(
      `INSERT INTO flash_card
         (concept, summary, idflash_card_set, syllabus_id)
       VALUES (?, ?, ?, ?)`,
      [question, answer, flashCardSetId, syllabusId]
    );

    inserted.push({
      id: res.insertId,
      question,
      answer,
      syllabus_id: syllabusId,
    });
  }

  await conn.end();
  return inserted;
}

function parseMCQSet(text) {
  const mcqs = [];

  const blocks = text
    .trim()
    .replace(/\r\n?/g, "\n")
    .split(/\n(?=\d+\.\s)/);

  for (const blk of blocks) {
    const lines = blk
      .trim()
      .split("\n")
      .map((l) => l.trim())
      .filter(Boolean);
    if (!lines.length) continue;

    let qLine = lines.shift().replace(/^\d+\.\s*/, "");
    qLine = qLine.replace(/^Q:\s*/i, "").trim();

    const answers = { A: "", B: "", C: "" };
    let correct = null;

    for (const ln of lines) {
      if (/^A\./i.test(ln)) answers.A = ln.replace(/^A\.\s*/i, "").trim();
      else if (/^B\./i.test(ln)) answers.B = ln.replace(/^B\.\s*/i, "").trim();
      else if (/^C\./i.test(ln)) answers.C = ln.replace(/^C\.\s*/i, "").trim();
      else if (/^Correct answer:/i.test(ln)) {
        const m = ln.match(/Correct answer:\s*([A-C])/i);
        if (m) correct = m[1].toUpperCase();
      }
    }

    if (answers.A && answers.B && answers.C && correct) {
      mcqs.push({
        question: qLine,
        answerA: answers.A,
        answerB: answers.B,
        answerC: answers.C,
        correct,
      });
    }
  }
  return mcqs;
}

function parseQA(text) {
  return text
    .split("$")
    .map((pair) => pair.trim())
    .filter(Boolean)
    .reduce((acc, pair) => {
      const [q, a] = pair.split("@").map((s) => s.trim());
      if (q && a) acc[q] = a;
      return acc;
    }, {});
}

async function HandleQuizSetInsertion(mcqArr, course) {
  const connection = await createConnectionFunc();
  const insertSql = `
  INSERT INTO quiz_questions
    (course, question,
     answer_a, answer_b, answer_c, correct_option)
  VALUES (?, ?, ?, ?, ?, ?)
`;

  for (const q of mcqArr) {
    const tuple = [
      course,
      q.question,
      q.answerA,
      q.answerB,
      q.answerC,
      q.correct,
    ];
    await connection.query(insertSql, tuple);
  }

  await connection.end();
}

async function createFlashCardSet(courseId) {
  const conn = await createConnectionFunc();
  const [res] = await conn.execute(
    `INSERT INTO flash_card_set (course_id) VALUES (?)`,
    [courseId]
  );
  await conn.end();
  return res.insertId;
}

async function classifySyllabusTopic(question, answer, courseId) {
  const conn = await createConnectionFunc();
  const [topics] = await conn.query(
    `SELECT id, topic FROM course_syllabus WHERE course_id = ?`,
    [courseId]
  );
  await conn.end();

  const list = topics.map((t, i) => `${i + 1}) ${t.topic}`).join("\n");

  const prompt = `You are helping tag flash-cards to the correct syllabus topic.
  
Flash-card question: "${question}"
Flash-card answer: "${answer}"

Here are the syllabus topics for this course:
${list}

**Instruction:** Pick exactly one of the above topics that best fits this Q-A. Only output the topic text (no numbering, no quotes).`;

  const aiResp = await openAIResponse(prompt);
  const chosen = aiResp.choices[0].message.content.trim();

  const match = topics.find((t) => t.topic === chosen);
  if (!match) {
    console.warn("GPT returned unknown topic:", chosen);
    return topics[0].id;
  }
  return match.id;
}

app.get("/api/tasks", async (req, res) => {
  const connection = await createConnectionFunc();
  const [rows] = await connection.query("SELECT * FROM `tasks`");
  await connection.end();
  res.json(rows);
});

app.get("/api/quiz/random", async (req, res) => {
  const connection = await createConnectionFunc();
  const [rows] = await connection.query(
    `SELECT question,
            answer_a AS answerA,
            answer_b AS answerB,
            answer_c AS answerC,
            correct_option AS correct
     FROM quiz_questions
     ORDER BY RAND() LIMIT 1`
  );
  await connection.end();

  if (!rows.length) return res.status(404).json({ error: "No quiz found" });
  res.json(rows[0]);
});

app.get("/CreateStudySchedule", async (req, res) => {
  res.json({
    message: "hi",
  });
});

app.post("/handlePerformance", async (req, res) => {
  const connection = await createConnectionFunc();
  const data = req.body.data;

  for (const { flash_card_id, correct } of data) {
    await connection.query(
      `INSERT INTO flash_card_performance (flash_card_id, outcome) VALUES (?, ?)`,
      [flash_card_id, correct]
    );
  }

  await connection.end();
  res.json({ status: "success" });
});

app.get("/api/performance/summary", async (req, res) => {
  let conn;
  try {
    conn = await createConnectionFunc();

    const [coursePerf] = await conn.query(`
      SELECT
        c.title   AS course,
        AVG(fcp.outcome) AS ratio
      FROM flash_card_performance fcp
      JOIN flash_card     fc  ON fc.idflash_card    = fcp.flash_card_id
      JOIN flash_card_set fcs ON fcs.idflash_card_set = fc.idflash_card_set
      JOIN courses        c   ON fcs.course_id       = c.id
      GROUP BY c.title
    `);

    const [topicPerf] = await conn.query(`
      SELECT
        cs.topic  AS topic,
        AVG(fcp.outcome) AS ratio
      FROM flash_card_performance fcp
      JOIN flash_card      fc  ON fc.idflash_card = fcp.flash_card_id
      JOIN course_syllabus cs ON fc.syllabus_id  = cs.id
      GROUP BY cs.topic
    `);

    const [missed] = await conn.query(`
      SELECT 
        fc.idflash_card,
        fc.concept,
        MAX(fcp.idflash_card_performance) AS latest_perf_id
      FROM flash_card_performance fcp
      JOIN flash_card fc ON fc.idflash_card = fcp.flash_card_id
      WHERE fcp.outcome = 0
      GROUP BY fc.idflash_card, fc.concept
      ORDER BY latest_perf_id DESC
    `);

    res.json({
      courses: coursePerf,
      topics: topicPerf,
      missed,
    });
  } catch (err) {
    console.error("Error generating performance summary:", err);
    res.status(500).json({ error: "Internal server error" });
  } finally {
    if (conn) await conn.end();
  }
});

app.get("/api/all_syllabuses", async (req, res) => {
  const conn = await createConnectionFunc();
  const [rows] = await conn.query(`
    SELECT
      c.id   AS course_id,
      c.title,
      cs.id  AS syllabus_id,
      cs.week_number,
      cs.topic
    FROM courses c
    LEFT JOIN course_syllabus cs
      ON cs.course_id = c.id
    ORDER BY c.id, cs.week_number, cs.id
  `);
  await conn.end();
  const byCourse = {};
  rows.forEach(({ course_id, title, syllabus_id, week_number, topic }) => {
    if (!byCourse[course_id]) {
      byCourse[course_id] = { id: course_id, title, syllabus: [] };
    }
    if (syllabus_id) {
      byCourse[course_id].syllabus.push({
        id: syllabus_id,
        week_number,
        topic,
      });
    }
  });
  res.json(Object.values(byCourse));
});

async function GetFlashCardPerformanceTuples() {
  const connection = await createConnectionFunc();

  const FlashCardPerformance = (
    await connection.query(
      `SELECT * FROM
    flash_card_performance AS fcp
    JOIN flash_card AS fc
    ON fc.idflash_card = fcp.flash_card_id
    WHERE idflash_card_set IS NOT NULL`
    )
  )[0];

  console.log(FlashCardPerformance);
  connection.end();
}

app.get("/api/all_prerequisites", async (req, res) => {
  const conn = await createConnectionFunc();
  try {
    const [rows] = await conn.query(`
      SELECT
        p.topic_id            AS topic_id,
        cs_pr.id              AS id,
        cs_pr.week_number     AS week_number,
        cs_pr.topic           AS topic,
        cs_pr.course_id       AS course_id
      FROM prerequisites p
      JOIN course_syllabus cs_pr
        ON p.prereq_topic_id = cs_pr.id
      ORDER BY p.topic_id, cs_pr.week_number
    `);

    const map = {};
    rows.forEach((r) => {
      if (!map[r.topic_id]) map[r.topic_id] = [];
      map[r.topic_id].push({
        id: r.id,
        week_number: r.week_number,
        topic: r.topic,
        course_id: r.course_id,
      });
    });

    res.json(map);
  } catch (err) {
    console.error(err);
    res.status(500).send("Internal error");
  } finally {
    await conn.end();
  }
});

app.get("/api/create-study-schedule", async (req, res) => {
  const connection = await createConnectionFunc();

  try {
    const underperformingTopics = await getUnderperformingTopics(connection);

    if (underperformingTopics.length === 0) {
      return res.json({ success: true, scheduled: [] });
    }

    const allRelevantTopics = await findAllRelevantTopics(
      connection,
      underperformingTopics
    );

    const sortedTopics = sortTopicsByPrerequisites(allRelevantTopics);

    const schedule = await createScheduleWithDates(connection, sortedTopics);

    await saveScheduleTasks(connection, schedule);

    const scheduledTopicNames = [];
    for (let i = 0; i < schedule.length; i++) {
      scheduledTopicNames.push(schedule[i].topicName);
    }

    res.json({
      success: true,
      scheduled: scheduledTopicNames,
    });
  } catch (error) {
    console.error("Error generating study schedule:", error);
    res.status(500).json({ error: "Internal server error" });
  } finally {
    await connection.end();
  }
});

async function getUnderperformingTopics(connection) {
  const query = `
    SELECT
      cs.id AS topicId,
      cs.topic AS topicName,
      AVG(fcp.outcome) AS averageScore
    FROM course_syllabus cs
    JOIN flash_card fc ON fc.syllabus_id = cs.id
    JOIN flash_card_performance fcp ON fcp.flash_card_id = fc.idflash_card
    GROUP BY cs.id, cs.topic
    HAVING COUNT(fcp.outcome) > 0 
       AND AVG(fcp.outcome) < 0.7
  `;

  const [rows] = await connection.query(query);
  return rows;
}

async function findAllRelevantTopics(connection, underperformingTopics) {
  const underperformingIds = [];
  for (let i = 0; i < underperformingTopics.length; i++) {
    underperformingIds.push(underperformingTopics[i].topicId);
  }

  const query = `
    SELECT
      topic_id AS topicId,
      prereq_topic_id AS prereqId
    FROM prerequisites
    WHERE topic_id IN (?) OR prereq_topic_id IN (?)
  `;
  const [prerequisiteEdges] = await connection.query(query, [
    underperformingIds,
    underperformingIds,
  ]);

  const adjacencyList = buildAdjacencyList(prerequisiteEdges);

  const allRelevantTopicIds = findReachableTopics(
    adjacencyList,
    underperformingIds
  );

  return {
    topicIds: allRelevantTopicIds,
    prerequisiteEdges: prerequisiteEdges,
    adjacencyList: adjacencyList,
  };
}

function buildAdjacencyList(prerequisiteEdges) {
  const adjacencyList = {};

  for (let i = 0; i < prerequisiteEdges.length; i++) {
    const edge = prerequisiteEdges[i];
    const topicId = edge.topicId;
    const prereqId = edge.prereqId;

    if (!adjacencyList[topicId]) {
      adjacencyList[topicId] = [];
    }

    adjacencyList[topicId].push(prereqId);

    if (!adjacencyList[prereqId]) {
      adjacencyList[prereqId] = [];
    }
  }

  return adjacencyList;
}

function findReachableTopics(adjacencyList, startingTopicIds) {
  const visited = new Set();

  function dfs(topicId) {
    if (!visited.has(topicId)) {
      // Mark it as visited
      visited.add(topicId);

      const prerequisites = adjacencyList[topicId] || [];
      for (let i = 0; i < prerequisites.length; i++) {
        dfs(prerequisites[i]);
      }
    }
  }

  for (let i = 0; i < startingTopicIds.length; i++) {
    dfs(startingTopicIds[i]);
  }

  return Array.from(visited);
}

function sortTopicsByPrerequisites(relevantTopicsData) {
  const topicIds = relevantTopicsData.topicIds;
  const prerequisiteEdges = relevantTopicsData.prerequisiteEdges;
  const adjacencyList = relevantTopicsData.adjacencyList;

  const inDegree = calculateInDegrees(topicIds, prerequisiteEdges);

  const sortedTopicIds = performTopologicalSort(
    topicIds,
    inDegree,
    adjacencyList
  );

  return sortedTopicIds;
}

function calculateInDegrees(topicIds, prerequisiteEdges) {
  const inDegree = {};
  const topicSet = new Set(topicIds);

  for (let i = 0; i < topicIds.length; i++) {
    inDegree[topicIds[i]] = 0;
  }

  for (let i = 0; i < prerequisiteEdges.length; i++) {
    const edge = prerequisiteEdges[i];
    const topicId = edge.topicId;
    const prereqId = edge.prereqId;

    if (topicSet.has(topicId) && topicSet.has(prereqId)) {
      inDegree[topicId]++;
    }
  }

  return inDegree;
}

function performTopologicalSort(topicIds, inDegree, adjacencyList) {
  const topicSet = new Set(topicIds);

  const queue = [];
  for (let i = 0; i < topicIds.length; i++) {
    const topicId = topicIds[i];
    if (inDegree[topicId] === 0) {
      queue.push(topicId);
    }
  }

  const sortedIds = [];

  while (queue.length > 0) {
    const currentId = queue.shift();
    sortedIds.push(currentId);

    const dependents = adjacencyList[currentId] || [];
    for (let i = 0; i < dependents.length; i++) {
      const dependentId = dependents[i];

      if (topicSet.has(dependentId)) {
        inDegree[dependentId]--;

        if (inDegree[dependentId] === 0) {
          queue.push(dependentId);
        }
      }
    }
  }

  return sortedIds;
}

async function createScheduleWithDates(connection, sortedTopicIds) {
  const query = `SELECT id, topic FROM course_syllabus WHERE id IN (?)`;
  const [topicRows] = await connection.query(query, [sortedTopicIds]);

  const topicNameById = {};
  for (let i = 0; i < topicRows.length; i++) {
    const row = topicRows[i];
    topicNameById[row.id] = row.topic;
  }

  const dayOffsets = calculateDayOffsets(sortedTopicIds);

  const tomorrow = addDays(new Date(), 1);
  const schedule = [];

  for (let i = 0; i < sortedTopicIds.length; i++) {
    const topicId = sortedTopicIds[i];
    const topicName = topicNameById[topicId];
    const dayOffset = dayOffsets[topicId];
    const scheduleDate = addDays(tomorrow, dayOffset);

    const scheduleItem = {
      topicId: topicId,
      topicName: topicName,
      date: format(scheduleDate, "yyyy-MM-dd"),
      description: `Review: ${topicName}`,
    };

    schedule.push(scheduleItem);
  }

  return schedule;
}

function calculateDayOffsets(sortedTopicIds) {
  const dayOffsets = {};

  for (let i = 0; i < sortedTopicIds.length; i++) {
    const topicId = sortedTopicIds[i];
    dayOffsets[topicId] = i; // Day 0, Day 1, Day 2, etc.
  }

  return dayOffsets;
}

async function saveScheduleTasks(connection, schedule) {
  const scheduleRows = [];
  for (let i = 0; i < schedule.length; i++) {
    const item = schedule[i];
    const row = [item.date, item.description];
    scheduleRows.push(row);
  }

  const query = `INSERT INTO tasks (date, description) VALUES ?`;
  await connection.query(query, [scheduleRows]);
}

app.get("/api/tasks", async (req, res) => {
  const conn = await createConnectionFunc();
  try {
    const [rows] = await conn.query(`
      SELECT 
        date,
        description AS \`task-content\`
      FROM tasks
      ORDER BY date
    `);
    res.json(rows);
  } catch (err) {
    console.error("Error in /api/tasks:", err);
    res.status(500).json({ error: "Internal server error" });
  } finally {
    await conn.end();
  }
});

app.get("/api/quizzes", async (req, res) => {
  const conn = await createConnectionFunc();
  const [rows] = await conn.query(
    `SELECT question, answer_a AS answerA, answer_b AS answerB,
            answer_c AS answerC, correct_option AS correct
     FROM quiz_questions`
  );
  await conn.end();
  res.json(rows);
});

async function syncAllPrerequisites() {
  const conn = await createConnectionFunc();
  try {
    const [syllabusRows] = await conn.query(`
      SELECT id, topic
      FROM course_syllabus
    `);

    const topicIdByName = {};
    syllabusRows.forEach(({ id, topic }) => {
      topicIdByName[topic] = id;
    });

    const allTopics = syllabusRows.map((r) => r.topic);
    const prereqTextMap = await findPrerequisiteMap(allTopics);

    const insertRows = [];
    Object.entries(prereqTextMap).forEach(([topicText, prereqTexts]) => {
      const topicId = topicIdByName[topicText];
      prereqTexts.forEach((prText) => {
        const prereqId = topicIdByName[prText];
        if (prereqId) {
          insertRows.push([topicId, prereqId]);
        }
      });
    });

    if (insertRows.length === 0) {
      console.log("No prerequisites found to insert.");
      return;
    }

    await conn.query(`TRUNCATE TABLE prerequisites`);

    await conn.query(
      `INSERT IGNORE INTO prerequisites (topic_id, prereq_topic_id)
         VALUES ?`,
      [insertRows]
    );

    console.log(`Inserted/updated ${insertRows.length} prerequisite links.`);
  } catch (err) {
    console.error("Failed to sync prerequisites:", err);
  } finally {
    await conn.end();
  }
}

app.get("/api/courses", async (req, res) => {
  const conn = await createConnectionFunc();
  try {
    const [rows] = await conn.query("SELECT id, title FROM courses");
    res.json(rows);
  } catch (err) {
    console.error("Error fetching courses:", err);
    res.status(500).json({ error: "Internal server error" });
  } finally {
    await conn.end();
  }
});

app.post("/api/courses", async (req, res) => {
  const { title } = req.body;
  const conn = await createConnectionFunc();
  try {
    const [result] = await conn.query(
      "INSERT INTO courses (title) VALUES (?)",
      [title]
    );
    res.json({ id: result.insertId, title });
  } catch (err) {
    console.error("Error creating course:", err);
    res.status(500).json({ error: "Internal server error" });
  } finally {
    await conn.end();
  }
});

app.listen(PORT, function onServerStart() {
  console.log("Server started on port " + PORT);
});
