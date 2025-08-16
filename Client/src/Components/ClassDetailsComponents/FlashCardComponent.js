import React, { useState, useEffect } from "react";
import "../../CSS/FlashCard.css";

function FlashCardComponent() {
  const [SelectedFile, setFile] = useState(null);

  const [cards, setCards] = useState([
    { id: 1, question: "q1", answer: "ans1" },
    { id: 2, question: "q2", answer: "ans2" },
    { id: 3, question: "q3", answer: "ans3" },
  ]);

  const [index, setIndex] = useState(0);
  const [explainButton, setExplainButton] = useState(false);
  const [animation, setAnimation] = useState(false);

  const [performance, setPerformance] = useState([]);

  const [hasSent, setHasSent] = useState(false);

  const fileChange = (event) => {
    setFile(event.target.files[0]);
  };

  const sendFile = async (e) => {
    e.preventDefault();
    const payLoad = new FormData();
    payLoad.append("file", SelectedFile);

    const response = await fetch("http://localhost:5000/handleFlashCardFile", {
      method: "POST",
      body: payLoad,
    });
    const {flashCards} = await response.json();
    const newCards = flashCards.map((card) => ({
      id: card.id,
      question: card.question,
      answer: card.answer,
    }));

    setCards(newCards);
    setIndex(0);
    setExplainButton(false);
    setPerformance([]);
    setHasSent(false);
  };

  useEffect(() => {
    if (cards.length === 0 && performance.length > 0 && !hasSent) {
      fetch("http://localhost:5000/handlePerformance", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ data: performance }),
      }).catch(console.error);
      setHasSent(true);
    }
  }, [cards, performance, hasSent]);

  function nextCard() {
    setAnimation(true);
    setIndex((idx) => (idx + 1) % cards.length);
    setTimeout(() => {
      setAnimation(false);
    }, 1000);
  }

  function showExplain() {
    setExplainButton((prev) => !prev);
  }

  function addCardPerformance(correct) {
    const flash_card_id = cards[index].id;

    setPerformance((prev) => [...prev, { flash_card_id, correct }]);

    const remaining = cards.filter((_, i) => i !== index);
    setCards(remaining);
    setIndex(0);
    setExplainButton(false);
  }

  return (
    <div className="flash-cards-container">
      <form onSubmit={sendFile}>
        <input type="file" onChange={fileChange} />
        <button type="submit"> Submit</button>
      </form>

      {cards.length === 0 ? (
        <p>No cards</p>
      ) : (
        <div className={animation ? `flash-card animate-flash` : `flash-card`}>
          {explainButton ? (
            <p className="explanation">{cards[index].answer}</p>
          ) : (
            <p className="concept">{cards[index].question}</p>
          )}
          <button onClick={nextCard}>Next Card</button>
          <button onClick={showExplain}>Show Explanation</button>
          <br />
          <br />
          <button onClick={() => addCardPerformance(1)}>Knew it</button>
          <button onClick={() => addCardPerformance(0)}>Didn't know it</button>
        </div>
      )}

      <div className="performance-container">
        {performance.map((perf, i) => (
          <div
            key={i}
            className={`perf-box ${perf.correct ? "correct" : "incorrect"}`}
          >
            {perf.flash_card_id}
          </div>
        ))}
      </div>
    </div>
  );
}

export default FlashCardComponent;
