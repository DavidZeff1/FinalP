import React, { useEffect, useState } from "react";
import "../../CSS/PersonDescryptionComponent.css";

export default function PersonDescryptionComponent() {
  const [data, setData] = useState({
    courses: [],
    topics:  [],
    missed:  []
  });

  useEffect(() => {
    fetch("http://localhost:5000/api/performance/summary")
      .then((r) => r.json())
      .then(setData)
      .catch(console.error);
  }, []);

  const percent = (ratio) => Math.round(ratio * 100);

  return (
    <div className="dashboard">
      <h2>Performance Overview</h2>

      <section>
        <h3>By Course</h3>
        {data.courses.map((c) => (
          <div key={c.course} className="bar-row">
            <span className="label">
              {c.course} ({percent(c.ratio)}%)
            </span>
            <div className="bar-container">
              <div
                className="bar"
                style={{ width: `${percent(c.ratio)}%` }}
              />
            </div>
          </div>
        ))}
      </section>

      {/* By Topic */}
      <section>
        <h3>By Topic</h3>
        {data.topics.map((t) => (
          <div key={t.topic} className="bar-row">
            <span className="label">
              {t.topic} ({percent(t.ratio)}%)
            </span>
            <div className="bar-container">
              <div
                className="bar"
                style={{ width: `${percent(t.ratio)}%` }}
              />
            </div>
          </div>
        ))}
      </section>

      {/* Recent Missed */}
      <section>
        <h3>Recent Missed Flash-Cards</h3>
        {data.missed.length === 0 ? (
          <p>No misses so far!</p>
        ) : (
          <ul className="missed-list">
            {data.missed.map((m) => (
              <li key={m.idflash_card}>
                <strong>{m.concept}</strong>
              </li>
            ))}
          </ul>
        )}
      </section>
    </div>
  );
}

