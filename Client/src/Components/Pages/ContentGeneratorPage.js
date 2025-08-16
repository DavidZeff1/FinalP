// src/Components/Pages/ContentGeneratorPage.jsx
import React, { useState, useEffect, useMemo } from "react";
import NavbarComponent from "./NavbarComponent";
import { ReactFlow, Controls, Background, MarkerType } from "@xyflow/react";
import "@xyflow/react/dist/style.css";

export default function ContentGeneratorPage() {
  const [courses, setCourses] = useState([]);
  const [prerequisitesByTopic, setPrereqs] = useState({});
  const columnGap = 300;
  const rowGap = 150;

  useEffect(() => {
    fetch("http://localhost:5000/api/all_syllabuses")
      .then((res) => res.json())
      .then(setCourses)
      .catch(console.error);
  }, []);

  useEffect(() => {
    if (courses.length === 0) return;

    fetch("http://localhost:5000/api/all_prerequisites")
      .then((res) => res.json())
      .then(setPrereqs)
      .catch(console.error);
  }, [courses]);

  // 3) Build React Flow nodes & edges
  const [nodes, edges] = useMemo(() => {
    if (courses.length === 0) {
      return [[], []];
    }

    const nodeList = [];
    const edgeList = [];

    courses.forEach((course, courseIndex) => {
      const xOffset = courseIndex * columnGap;

      (course.syllabus || []).forEach((topic, topicIndex) => {
        nodeList.push({
          id: topic.id.toString(),
          position: { x: xOffset, y: topicIndex * rowGap },
          data: { label: topic.topic },
          style: {
            width: 120,
            height: 120,
            borderRadius: "50%",
            display: "flex",
            alignItems: "center",
            justifyContent: "center",
            textAlign: "center",
            fontWeight: "bold",
          },
        });

        const prereqList = prerequisitesByTopic[topic.id] || [];
        prereqList.forEach((prereq) => {
          edgeList.push({
            id: `e-${prereq.id}-${topic.id}`,
            source: prereq.id.toString(),
            target: topic.id.toString(),
            style: {
              stroke: prereq.course_id === course.id ? "#333" : "#888",
              strokeWidth: 2,
              strokeDasharray: prereq.course_id === course.id ? "0" : "6 4",
            },
            markerEnd: {
              type: MarkerType.ArrowClosed,
              color: prereq.course_id === course.id ? "#333" : "#888",
            },
          });
        });
      });
    });

    return [nodeList, edgeList];
  }, [courses, prerequisitesByTopic]);

  return (
    <>
      <NavbarComponent />

      {/* Course Titles Row */}
      <div
        style={{
          display: "flex",
          margin: "1rem 0",
          fontFamily: "sans-serif",
          fontWeight: "bold",
        }}
      >
        {courses.map((course, idx) => (
          <div
            key={course.id}
            style={{
              width: columnGap,
              textAlign: "center",
            }}
          >
            {course.title}
          </div>
        ))}
      </div>

      {/* Graph */}
      <div style={{ height: 700, width: "100%" }}>
        <ReactFlow nodes={nodes} edges={edges} fitView>
          <Background gap={12} size={1} />
          <Controls />
        </ReactFlow>
      </div>
    </>
  );
}
