import NavbarComponent from "./NavbarComponent";
import TopicCardComponent from "../ClassesPageComponents/TopicCardComponent";
import "../../CSS/ClassesComponentCSS.css";
import FlashCardComponent from "../ClassDetailsComponents/FlashCardComponent";
import GameComponent from "../ClassDetailsComponents/GameComponent";
import UnityGameComponent from "../ClassDetailsComponents/UnityGameComponent";
import SummarizePDF from "../ClassDetailsComponents/SummarizePDF";
import "../../CSS/ClassDetailPage.css";
import { useState, useEffect } from "react";
import { Link } from "react-router-dom";

function ClassesComponent() {
  const [courses, setCourses] = useState([]);

  const [index, setIndex] = useState(0);

  const slides = [
    <SummarizePDF key="summarize" />,
    <FlashCardComponent key="flashcards" />,
    <GameComponent key="game" />,
    <UnityGameComponent key="unityGame" />,
  ];

  const handlePrev = () =>
    setIndex((i) => (i === 0 ? slides.length - 1 : i - 1));

  const handleNext = () =>
    setIndex((i) => (i === slides.length - 1 ? 0 : i + 1));

  // === Fetch all courses from MySQL via your backend ===
  const fetchCourses = async () => {
    try {
      const res = await fetch("http://localhost:5000/api/courses");
      if (!res.ok) throw new Error(res.statusText);
      const data = await res.json(); // data: Array<{id:number, title:string}>
      setCourses(data);
    } catch (err) {
      console.error("Error fetching courses:", err);
    }
  };

  useEffect(() => {
    fetchCourses();
  }, []);

  return (
    <>
      <NavbarComponent />

      <div className="class-container">
        <h3>My Classes</h3>

        <div className="class-container-topics">
          {courses.map((course) => (
            <Link
              key={course.id}
              to={`/classes/${course.id}`}
              state={{ title: course.title }}
              className="topic-card-slot"
            >
              <TopicCardComponent
                optionsSvg="/svg/options.svg"
                topicImg="/images/books.png"
                topic={course.title}
              />
            </Link>
          ))}
        </div>
        <br />
        <br />
        <br />

        <div className="class-detail-page">
          <div className="carousel">
            <button className="nav prev" onClick={handlePrev}>
              &#10094;
            </button>

            <div className="slide">{slides[index]}</div>
            <button className="nav next" onClick={handleNext}>
              &#10095;
            </button>
          </div>
        </div>
      </div>
    </>
  );
}

export default ClassesComponent;
