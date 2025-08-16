import "../../CSS/GameComponent.css";
import React, { useState, useEffect } from "react";

const GameComponent = () => {
  const [selectFile, setSelectFile] = useState(null);

  const [questions, setQuestions] = useState([
    "question1",
    "question2",
    "question3",
  ]);

  const [answers, setAnswers] = useState(["answer1", "answer2", "answer3"]);
  const [result, setResult] = useState({ text: "...", result: false });

  const [clickedQuestion, setClickedQuestion] = useState({
    clicked: false,
    index: -1,
  });
  const [clickedAnswer, setClickedAnswer] = useState({
    clicked: false,
    index: -1,
  });

  useEffect(() => {
    if (clickedQuestion.clicked && clickedAnswer.clicked) {
      const correct = clickedQuestion.index === clickedAnswer.index;
      if (correct) {
        setResult({ text: "Correct!", result: true });
      } else {
        setResult({ text: "Incorrect!", result: false });
      }
    }
  }, [clickedQuestion, clickedAnswer]);

  const clickedOnQuestion = (clickedIndex) => {
    setClickedQuestion({ clicked: true, index: clickedIndex });
  };

  const clickedOnAnswer = (clickedIndex) => {
    setClickedAnswer({ clicked: true, index: clickedIndex });
  };

  const fileChange = (event) => {
    setSelectFile(event.target.files[0]);
  };

  const gameFileSubmit = async (event) => {
    event.preventDefault();
    const data = new FormData();
    data.append("file", selectFile);

    const response = await fetch("http://localhost:5000/handleGameFile", {
      method: "POST",
      body: data,
    });

    const result = await response.json();
    console.log(result.result);
    separateKeysAndValues(result.result);
  };

  function separateKeysAndValues(obj) {
    const keys = [];
    const values = [];
    for (const key in obj) {
      if (obj.hasOwnProperty(key)) {
        keys.push(key);
        values.push(obj[key]);
      }
    }
    setQuestions(keys);
    setAnswers(values);
  }

  return (
    <>
      <div className="start-game-button">
        <form>
          <input type="file" onChange={fileChange} />
          <button onClick={gameFileSubmit}>Submit</button>
        </form>
      </div>
      <div className="game-container">
        <div className="question-section">
          {questions.map((value, index) => (
            <p
              key={index}
              className={`question${index} question ${
                clickedQuestion.clicked && clickedQuestion.index === index
                  ? "clicked"
                  : ""
              }`}
              onClick={() => clickedOnQuestion(index)}
            >
              {value}
            </p>
          ))}
        </div>
        <div className="answer-section">
          {answers.map((value, index) => (
            <p
              key={index}
              className={`answer${index} answer ${
                clickedAnswer.clicked && clickedAnswer.index === index
                  ? "clicked"
                  : ""
              }`}
              onClick={() => clickedOnAnswer(index)}
            >
              {value}
            </p>
          ))}
        </div>
        <div className={`result-section ${result.result ? "success" : "fail"}`}>
          {result.text}
        </div>
      </div>
    </>
  );
};

export default GameComponent;
