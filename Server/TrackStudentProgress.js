const mysql = require("mysql2/promise");

async function getAverageMasteryPerTopic(connection, studentId) {
  const [rows] = await connection.query(
    `
    SELECT
      topic,
      AVG(success_ratio)     AS avgMastery,
      COUNT(*)               AS attempts
    FROM flash_card_performance
    WHERE student_id = ?
    GROUP BY topic
    ORDER BY avgMastery DESC
    `,
    [studentId]
  );
  return rows;
}

async function getTopicTrends(connection, studentId) {
  const [rows] = await connection.query(
    `
    SELECT
      topic,
      DATE(reviewed_at)      AS date,
      AVG(success_ratio)     AS avgMastery
    FROM flash_card_performance
    WHERE student_id = ?
    GROUP BY topic, DATE(reviewed_at)
    ORDER BY topic, date
    `,
    [studentId]
  );

  const byTopic = {};
  for (const { topic, date, avgMastery } of rows) {
    byTopic[topic] = byTopic[topic] || [];

    byTopic[topic].push({
      x: new Date(date).getTime() / (1000 * 60 * 60 * 24),
      y: avgMastery,
    });
  }

  const trends = [];
  for (const topic of Object.keys(byTopic)) {
    const points = byTopic[topic];
    const n = points.length;
    if (n < 2) {
      trends.push({ topic, slope: 0 });
      continue;
    }
    let sumX = 0,
      sumY = 0,
      sumXY = 0,
      sumXX = 0;
    for (const { x, y } of points) {
      sumX += x;
      sumY += y;
      sumXY += x * y;
      sumXX += x * x;
    }
    const slope = (n * sumXY - sumX * sumY) / (n * sumXX - sumX * sumX);
    trends.push({ topic, slope });
  }

  return trends.sort((a, b) => b.slope - a.slope);
}

async function getHotZones(connection, studentId, topN = 5) {
  const avg = await getAverageMasteryPerTopic(connection, studentId);
  // pick the bottom `topN`
  return avg
    .sort((a, b) => a.avgMastery - b.avgMastery)
    .slice(0, topN)
    .map(({ topic, avgMastery }) => ({ topic, avgMastery }));
}

(async () => {
  const conn = await mysql.createConnection({});
  const studentId = 42;

  const avgPerTopic = await getAverageMasteryPerTopic(conn, studentId);
  console.log("Average mastery per topic:", avgPerTopic);

  const trends = await getTopicTrends(conn, studentId);
  console.log("Topic trends (slope in mastery/day):", trends);

  const hotZones = await getHotZones(conn, studentId, 3);
  console.log("Hot zones (weakest topics):", hotZones);

  await conn.end();
})();
