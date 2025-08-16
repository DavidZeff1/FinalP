const mysql = require("mysql2/promise");
const {
  csFlashCardData,
  flashCardPerformance,
  students,
  tasksData,
} = require("./data/dataLists");
require("dotenv").config();

async function insertStudents(connection, students) {
  await connection.query(
    "INSERT INTO student (idstudent, name, college, degree, address, age) VALUES ?",
    [students]
  );
}

async function deleteAll(connection, table) {
  await connection.query(`DELETE FROM ${table}`);
}

async function insertTestPerformance(connection, data) {
  await connection.query(
    "INSERT INTO `student_website`.`test_performance` (idtest_performance, success_ratio, student_id, topic) VALUES ?",
    [data]
  );
}

async function insertFlashCards(connection, data) {
  await connection.query(
    "INSERT INTO `student_website`.`flash_card` (idflash_card, concept, summary, course) VALUES ?",
    [data]
  );
}

async function insertTests(connection, data) {
  await connection.query(
    "INSERT INTO `student_website`.`test` (idtest, question, answer, course) VALUES ?",
    [data]
  );
}

async function inserttasksData(connection, data) {
  await connection.query(
    "INSERT INTO `student_website`.`tasks` (idtasks, `task-content`, studentid, date) VALUES ?",
    [data]
  );
}

async function insertFlashCardSchedule(connection, data) {
  const sql = `
    INSERT INTO \`student_website\`.\`flash_card_schedule\`
      (student_id,
       flash_card_id,
       repetition,
       interval_days,
       ease_factor,
       last_reviewed_at,
       next_review_date),
       rating
    VALUES ?
  `;
  await connection.query(sql, [data]);
}

async function insertFlashCardPerformance(connection, data) {
  const sql = `
    INSERT INTO \`flash_card_performance\`
      (student_id, flash_card_id, outcome)
    VALUES ?
  `;
  await connection.query(sql, [data]);
}

async function insertFlashCardSets(connection, data) {
  const sql = `
    INSERT INTO \`student_website\`.\`flash_card_set\`
      (course,
       main_topic,
       subtopic_1,
       importance_1,
       subtopic_2,
       importance_2,
       subtopic_3,
       importance_3)
    VALUES ?
  `;
  await connection.query(sql, [data]);
}



async function createConnectionFunc() {
  const connection = await mysql.createConnection({
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE,
  });
  return connection;
}

async function main() {
  const connection = await createConnectionFunc();

  await connection.end();
}

main().catch(console.error);

module.exports = {
  insertFlashCardPerformance,
  createConnectionFunc,
  insertFlashCards,
  insertFlashCardSets
};
