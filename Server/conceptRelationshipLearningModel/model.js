require("dotenv").config({
  path: require("path").resolve(__dirname, "../.env"),
});
const mysql = require("mysql2/promise");
const { tf } = require("./preProcessor");

let classifierModel = null;

async function initializeClassifier() {
  const { flashCards } = await loadFromDatabase();

  const { documents, termIndex, numDocs, documentFrequency } =
    buildTfIdfDocuments(flashCards);

  const { featureMatrix, labelMatrix } = vectorizeTrainingSet(
    documents,
    termIndex
  );

  const model = trainLogisticRegression(
    featureMatrix,
    labelMatrix,
    COURSE_TITLES.length
  );

  classifierModel = { model, termIndex, numDocs, documentFrequency };
}

function classifyFlashCard({ concept, summary }) {
  if (!classifierModel) {
    throw new Error(
      "Classifier not initialized – call initializeClassifier() first"
    );
  }

  const text = `${concept} ${summary}`;
  const vec = vectorizeSingleSummary(
    text,
    classifierModel.termIndex,
    classifierModel.numDocs,
    classifierModel.documentFrequency
  );

  const idx = predictClass(classifierModel.model, vec);

  return COURSE_TITLES[idx];
}

let COURSE_TITLES = [];

const NUM_EPOCHS = 50;
const LEARNING_RATE = 0.01;

function softmax(rawScores) {
  let maxScore = rawScores[0];
  for (let i = 1; i < rawScores.length; i++) {
    if (rawScores[i] > maxScore) {
      maxScore = rawScores[i];
    }
  }

  const exponentials = [];
  let sumOfExponentials = 0;

  for (let i = 0; i < rawScores.length; i++) {
    const shiftedScore = rawScores[i] - maxScore;
    const exponentialValue = Math.exp(shiftedScore);

    exponentials[i] = exponentialValue;
    sumOfExponentials += exponentialValue;
  }

  const probabilities = [];
  for (let i = 0; i < exponentials.length; i++) {
    probabilities[i] = exponentials[i] / sumOfExponentials;
  }

  return probabilities;
}

function buildTfIdfDocuments(flashCards) {
  const documentFrequency = new Map();
  const documents = flashCards.map((card) => {
    const text = `${card.concept} ${card.summary}`;
    const termCount = tf(text);
    const termCounts = Array.from(termCount.entries());
    const totalTokens = termCounts.reduce((sum, [, c]) => sum + c, 0);

    const tfPairs = termCounts.map(([term, count]) => {
      documentFrequency.set(term, (documentFrequency.get(term) || 0) + 1);
      return { term, tf: count / totalTokens };
    });

    return { tfPairs, courseTitle: card.courseTitle.toLowerCase() };
  });

  const numDocs = documents.length;

  for (const doc of documents) {
    for (const pair of doc.tfPairs) {
      const df = documentFrequency.get(pair.term);
      const idf = Math.log((1 + numDocs) / (1 + df)) + 1;
      pair.idf = idf;
      pair.tfIdf = pair.tf * idf;
    }
  }

  const termIndex = new Map();
  let idx = 0;
  for (const term of documentFrequency.keys()) {
    termIndex.set(term, idx++);
  }

  return { documents, termIndex, numDocs, documentFrequency };
}

function vectorizeTrainingSet(documents, termIndexMap) {
  const featureMatrix = [],
    labelMatrix = [];
  const numTerms = termIndexMap.size;
  const numCourses = COURSE_TITLES.length;

  for (const doc of documents) {
    const combined = new Array(numTerms + numCourses).fill(0);

    for (const { term, tfIdf } of doc.tfPairs) {
      combined[termIndexMap.get(term)] = tfIdf;
    }

    const cIdx = COURSE_TITLES.indexOf(doc.courseTitle);
    if (cIdx >= 0) combined[numTerms + cIdx] = 1;

    featureMatrix.push(combined.slice(0, numTerms));
    labelMatrix.push(combined.slice(numTerms));
  }

  return { featureMatrix, labelMatrix };
}

function vectorizeSingleSummary(
  summaryText,
  termIndex,
  numDocs,
  documentFrequencyMap
) {
  const rawCounts = tf(summaryText);
  const termCounts = Array.from(rawCounts.entries());
  const totalTokens = termCounts.reduce((sum, [, c]) => sum + c, 0);
  const feature = new Array(termIndex.size).fill(0);

  for (const [term, count] of termCounts) {
    const idx = termIndex.get(term);
    if (idx == null) continue;
    const df = documentFrequencyMap.get(term) || 1;
    const idf = Math.log((1 + numDocs) / (1 + df)) + 1;
    feature[idx] = (count / totalTokens) * idf;
  }
  return feature;
}

function trainLogisticRegression(featureMatrix, labelMatrix, numClasses) {
  const numSamples = featureMatrix.length;
  const numFeatures = featureMatrix[0].length;

  const weights = [];
  for (let c = 0; c < numClasses; c++) {
    weights[c] = [];
    for (let j = 0; j < numFeatures; j++) {
      weights[c][j] = 0;
    }
  }

  const biases = [];
  for (let c = 0; c < numClasses; c++) {
    biases[c] = 0;
  }

  for (let epoch = 0; epoch < NUM_EPOCHS; epoch++) {
    for (let i = 0; i < numSamples; i++) {
      const features = featureMatrix[i];
      const labels = labelMatrix[i];

      const scores = [];
      for (let c = 0; c < numClasses; c++) {
        let score = biases[c];

        for (let j = 0; j < numFeatures; j++) {
          score += weights[c][j] * features[j];
        }

        scores[c] = score;
      }

      const probs = softmax(scores);

      for (let c = 0; c < numClasses; c++) {
        const error = probs[c] - labels[c];

        biases[c] -= LEARNING_RATE * error;

        for (let j = 0; j < numFeatures; j++) {
          weights[c][j] -= LEARNING_RATE * error * features[j];
        }
      }
    }
  }

  return { weights, biases };
}

function predictClass(model, featureVector) {
  const { weights, biases } = model;
  let bestIdx = 0,
    bestVal = -Infinity;
  for (let c = 0; c < weights.length; c++) {
    let s = biases[c];
    for (let j = 0; j < featureVector.length; j++) {
      s += weights[c][j] * featureVector[j];
    }
    if (s > bestVal) (bestVal = s), (bestIdx = c);
  }
  return bestIdx;
}

async function loadFromDatabase() {
  const conn = await mysql.createConnection({
    host: "127.0.0.1",
    port: 3306,
    user: "root",
    password: "123456789",
    database: "student_website",
  });

  const [flashRows] = await conn.query(`
    SELECT concept, summary, course_title AS courseTitle
    FROM flashcards
  `);

  const [courses] = await conn.query(`
    SELECT DISTINCT course_title AS courseTitle
    FROM flashcards
  `);

  const [testRows] = await conn.query(`
    SELECT summary, expected_course AS expected
    FROM sample_tests
  `);

  await conn.end();

  COURSE_TITLES = courses.map((r) => r.courseTitle.toLowerCase()).sort(); // optional: keep a stable order

  return { flashCards: flashRows, sampleTests: testRows };
}

(async function main() {
  const { flashCards, sampleTests } = await loadFromDatabase();
  console.log(
    `Loaded ${flashCards.length} flashcards, ${sampleTests.length} tests.`
  );
  console.log(`Detected courses: ${COURSE_TITLES.join(", ")}`);

  const { documents, termIndex, numDocs, documentFrequency } =
    buildTfIdfDocuments(flashCards);

  const { featureMatrix, labelMatrix } = vectorizeTrainingSet(
    documents,
    termIndex
  );

  const model = trainLogisticRegression(
    featureMatrix,
    labelMatrix,
    COURSE_TITLES.length
  );

  let correct = 0;
  console.log("\n=== SAMPLE TESTS ===");
  for (let i = 0; i < sampleTests.length; i++) {
    const t = sampleTests[i];
    const vec = vectorizeSingleSummary(
      t.summary,
      termIndex,
      numDocs,
      documentFrequency
    );
    const predIdx = predictClass(model, vec);
    const pred = COURSE_TITLES[predIdx];
    const ok = pred === t.expected;
    if (ok) correct++;
    console.log(
      `#${i + 1}: expected=${t.expected}, predicted=${pred} ${ok ? "✓" : "✗"}`
    );
  }
  console.log(
    `\nAccuracy: ${((100 * correct) / sampleTests.length).toFixed(1)}%`
  );
})();

module.exports = {
  initializeClassifier,
  classifyFlashCard,
};
