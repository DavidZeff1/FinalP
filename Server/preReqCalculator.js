// preReqCalculator.js
const scrapeWikipediaTopic = require("./wikiScraper");
const { createConnectionFunc } = require("./mySQLdbAdmin");

async function fetchAllLinks(topics) {
  console.log("[fetchAllLinks] received topics:", topics);

  const results = await Promise.all(
    topics.map(async (topic) => {
      const { links } = await scrapeWikipediaTopic(topic);
      return { topic, links };
    })
  );

  const linksMap = {};
  results.forEach(({ topic, links }) => {
    linksMap[topic] = links;
  });
  
  return linksMap;
}

async function findPrerequisiteMap(p_topics) {
  const linksMap = await fetchAllLinks(p_topics);

  const prereqMap = {};
  p_topics.forEach((topic) => {
    const links = linksMap[topic] || [];
    const prerequisites = p_topics.filter((other) => {
      const isPrereq =
        other !== topic &&
        links.some((link) => link.toLowerCase().includes(other.toLowerCase()));
      return isPrereq;
    });

    prereqMap[topic] = prerequisites;
  });
  return prereqMap;
}

async function syncAllPrerequisites() {
  const conn = await createConnectionFunc();

  // 1) Load every topic string + its id
  const [syllabusRows] = await conn.query(`
      SELECT id, topic
      FROM course_syllabus
    `);
  // build a lookup: topic text → id
  const topicIdByName = {};
  syllabusRows.forEach(({ id, topic }) => {
    topicIdByName[topic] = id;
  });

  // 2) Compute the prerequisite map
  const allTopics = syllabusRows.map((r) => r.topic);
  const prereqTextMap = await findPrerequisiteMap(allTopics);

  // 3) Flatten into insertRows
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
    return;
  }

  // 4) Wipe out old entries
  await conn.query(`TRUNCATE TABLE prerequisites`);

  // 5) Bulk insert
  console.log("[syncAllPrerequisites] bulk inserting prerequisites…");
  const [insertResult] = await conn.query(
    `INSERT IGNORE INTO prerequisites (topic_id, prereq_topic_id) VALUES ?`,
    [insertRows]
  );
}

// (async () => {
//  await syncAllPrerequisites();
// })();

module.exports = {
  findPrerequisiteMap,
  syncAllPrerequisites,
};
