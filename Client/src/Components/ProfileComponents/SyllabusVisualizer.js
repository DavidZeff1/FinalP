import React, { useState, useEffect } from "react";

export default function AllCoursesSyllabus() {
  const [coursesData, setCoursesData] = useState([]);

  useEffect(() => {
    fetch("http://localhost:5000/api/all_syllabuses")
      .then((r) => r.json())
      .then(setCoursesData)
      .catch(console.error);
  }, []);

  return (
    <div className="p-6 space-y-10">
      {coursesData.map((course) => (
        <section key={course.id}>
          <h2 className="text-3xl font-bold mb-4">{course.title}</h2>

          {course.syllabus.length > 0 ? (
            <SyllabusVisualizer syllabus={course.syllabus} />
          ) : (
            <p className="text-gray-500">No syllabus defined yet.</p>
          )}
        </section>
      ))}
    </div>
  );
}

function SyllabusVisualizer({ syllabus }) {
  const weeks = Object.entries(
    syllabus.reduce((acc, { week_number, topic }) => {
      if (!acc[week_number]) acc[week_number] = [];
      acc[week_number].push(topic);
      return acc;
    }, {})
  )
    .map(([week, topics]) => ({ week: Number(week), topics }))
    .sort((a, b) => a.week - b.week);
  return (
    <div className="p-4 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
      {weeks.map(({ week, topics }) => (
        <div
          key={week}
          className="bg-white rounded-2xl shadow-md p-5 hover:shadow-lg transition-shadow"
        >
          <h3 className="text-2xl font-bold mb-3 text-indigo-600">
            Week {week}
          </h3>
          <ul className="list-disc list-inside space-y-1">
            {topics.map((topic, i) => (
              <li key={i} className="text-gray-800">
                {topic}
              </li>
            ))}
          </ul>
        </div>
      ))}
    </div>
  );
}
