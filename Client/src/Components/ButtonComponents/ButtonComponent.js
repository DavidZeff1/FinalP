import "../../CSS/ButtonComponentCSS.css";

function ButtonComponent({ buttonText, clicked }) {
    return (
        <button className="next-class-card-body-button" onClick={clicked}>
            {buttonText}
        </button>
    );
}

export default ButtonComponent;
