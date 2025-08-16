import NavbarComponent from "./NavbarComponent";
import { Link } from "react-router-dom";
import "../../CSS/HomeComponentCSS.css";

function HomeComponent() {
  return (
    <>
      <NavbarComponent />
      <div className="home-container">
        <div className="opening-description">
          <p className="opening-description-body">
            Hello!
            <br /> Welcome to the website that will make you a better student
            with the power of AI 🤖
          </p>
          <p className="opening-description-footer">Click Here To Get Started!</p>
          <Link to="/classes">
            <button className="opening-description-button">Try Now</button>
          </Link>
        </div>

        <img
          className="opening-img"
          src="images/man-blue-shirt-smiling-with-backpack.png"
          alt="student-picture"
        />
      </div>
    </>
  );
}
export default HomeComponent;
