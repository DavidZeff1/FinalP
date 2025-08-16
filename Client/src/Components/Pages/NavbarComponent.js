import { MdAssignment } from "react-icons/md";
import { FaBookOpen } from "react-icons/fa6";
import { FaHome, FaGamepad, FaGraduationCap, FaCalendarAlt} from "react-icons/fa";
import { CgMenuRight, CgMenuRightAlt } from "react-icons/cg";
import { CiSettings } from "react-icons/ci";
import "../../CSS/NavBarCSS.css";
import { useState } from "react";
import { Link } from "react-router-dom";

function NavbarComponent() {
    const [buttonState, setButtonState] = useState(false); // Initialize as false

    const handleOnClick = () => {
        setButtonState((prev) => !prev); // Toggle the state
    };

    return (
        <nav className="Navbar">
            <div className="icons logo">
                <img src={`${process.env.PUBLIC_URL}/images/logo.png`} alt="Logo" />
            </div>
            <Link className="icons" to="/">
                <FaHome />
            </Link>
            <Link className="icons" to="/classes">
                <FaBookOpen />
            </Link>
            <Link className="icons" to="/ContentGeneratorPage">
                <MdAssignment />
            </Link>
            <Link className="icons" to="/CalendarComponent">
                <FaCalendarAlt />
            </Link>
            <Link className="icons" to="/profile">
                <FaGraduationCap />
            </Link>

            <div className="icons drop-down-button" onClick={handleOnClick}>
                {buttonState ? (
                    <>
                        <CgMenuRightAlt />
                        <div className="drop-down-menu">
                            <Link to="/games">
                                <FaGamepad /> Games
                            </Link>
                            <Link to="/settings">
                                <CiSettings /> Settings
                            </Link>
                        </div>
                    </>
                ) : (
                    <CgMenuRight />
                )}
            </div>
        </nav>
    );
}

export default NavbarComponent;
