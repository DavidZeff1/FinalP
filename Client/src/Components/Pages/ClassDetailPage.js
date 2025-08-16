import { useParams, useLocation } from "react-router-dom";
import { useState, useEffect } from "react";
import NavbarComponent from "./NavbarComponent";
import "../../CSS/ClassDetailPage.css";

function ClassDetailPage() {
  const { classId } = useParams();
  const [cards, setCards] = useState([]);
  const { state } = useLocation();
  const courseTitle = state?.title ?? `Course ${classId}`;

  useEffect(() => {
    async function loadCards() {
      try {
        const res = await fetch(
          `http://localhost:5000/api/courses/${classId}/flashcards`
        );
        if (!res.ok) throw new Error(res.statusText);
        const data = await res.json();
        setCards(data);
      } catch (err) {
        console.error("Failed to load flashcards:", err);
      } 
    }
    loadCards();
  }, [classId]);

  return (
    <>
      <NavbarComponent />
      <div className="class-detail-page">
        <h1>{courseTitle} Flashcards</h1>

        {
          <div className="flashcards-list">
            {cards.map((card) => (
              <div key={card.id} className="flashcard">
                <h3 className="question">{card.question}</h3>
                <p className="answer">{card.answer}</p>
              </div>
            ))}
          </div>
        }
      </div>
    </>
  );
}

export default ClassDetailPage;
