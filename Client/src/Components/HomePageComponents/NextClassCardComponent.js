import { FaGraduationCap } from "react-icons/fa";
import ButtonComponent from "../ButtonComponents/ButtonComponent"
import '../../CSS/NextClassCardCSS.css'
function NextClassCardComponent(){
    return (
    <>
        <div className="next-class-card">
            <div className="next-class-card-header">
                <FaGraduationCap/>
                <p>Your Next Class Is:</p>
            </div>
            <div className="next-class-card-body">
                <img className="next-class-card-body-img" src={process.env.PUBLIC_URL + '/images/biological.png'} alt="biology-class"/>
                <p className="next-class-card-body-content">
                    Biology
                    <br/>
                    <small className="next-class-card-body-content-time">
                        08:30 - 11:00
                    </small>
                </p>
                <ButtonComponent buttonText="Open Course"/>
            </div>
        </div>
    </>
    );
}
export default NextClassCardComponent;