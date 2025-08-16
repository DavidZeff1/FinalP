const { createConnectionFunc, insertFlashCards } = require("./mySQLdbAdmin");
const conceptAnswerPair = {
  "Introduction to Programming":
    "An overview of programming fundamentals including syntax, semantics, and basic constructs.",
    "Introduction to Programming":
    "An overview of programming fundamentals including syntax, semantics, and basic constructs.",
    "Introduction to Programming":
    "An overview of programming fundamentals including syntax, semantics, and basic constructs.",
    "Introduction to Programming":
    "An overview of programming fundamentals including syntax, semantics, and basic constructs.",
};
async function insertFlashCardsIntoDB() {
  const connection = await createConnectionFunc();
  const getMaxIdQuery = "SELECT MAX(idflash_card) FROM flash_card";
  const resultTable = await connection.query(getMaxIdQuery);
  const maxId = resultTable[0][0]["MAX(idflash_card)"];
  const newId = maxId + 1;
  const newTuple = convertConceptAnswerPairIntoTuple(conceptAnswerPair, newId);
  const insertQuery = `INSERT INTO flash_card (idflash_card, concept, summary, course) VALUES (?,?,?,?)`;
  await connection.query(insertQuery,newTuple)
  await connection.end();
}

function convertConceptAnswerPairIntoTuple(conceptAnswerPair, maxId) {
  const keys = Object.keys(conceptAnswerPair);
  const key = keys[0];
  const value = conceptAnswerPair[key];
  const convertedTuple = [maxId, key, value, "CS 101"];
  return convertedTuple;
}

function main() {
  insertFlashCardsIntoDB();
}

main();
