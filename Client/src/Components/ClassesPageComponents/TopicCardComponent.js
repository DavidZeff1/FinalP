import { useState } from "react";
import "../../CSS/TopicCardComponentCSS.css";

const TOPIC_IMAGES = [
  "art.png",
  "atom.png",
  "books.png",
  "computer.png",
  "dna.png",
  "heart.png",
  "microscope.png",
  "pen.png",
  "pencil.png",
  "planet.png",
  "science_cup.png",
  "telescope.png",
];

function TopicCardComponent(props) {

  const [imgSrc, setImgSrc] = useState(props.topicImg);
  const [showPicker, setShowPicker] = useState(false);

  function handleChoose(fileName) {
    setImgSrc(`/images/images-topics/${fileName}`);
    setShowPicker(false);
  }

  return (
    <>
      {showPicker && (
        <div className="picker-overlay" onClick={() => setShowPicker(false)}>

          <div
            className="picker-modal"
            onClick={(e) => e.stopPropagation()}
          >
            {TOPIC_IMAGES.map((file) => (
              <img
                key={file}
                src={`/images/images-topics/${file}`}
                alt={file}
                className="picker-thumb"
                onClick={() => handleChoose(file)}
              />
            ))}
          </div>
        </div>
      )}

      <div className="topic-card-container">
        <div
          className="topic-card-options"
          onClick={() => setShowPicker(true)}
        >
          <img
            src={process.env.PUBLIC_URL + props.optionsSvg}
            alt="options"
          />
        </div>

        <div className="topic-card-img">
          <img
            src={process.env.PUBLIC_URL + imgSrc}
            alt="topic"
          />
        </div>

        <div className="topic-card-title">{props.topic}</div>
      </div>
    </>
  );
}

export default TopicCardComponent;
