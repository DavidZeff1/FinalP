import '../../CSS/CalendarCardComponentCSS.css';
import { FaCalendarAlt } from "react-icons/fa";
function CalendarCardComponent(){
    return(
    <>
    <div className='calendar-card'>
            <div className="calendar-card-header">
                <FaCalendarAlt/>
                <p>Calendar</p>
            </div>
            <div className='calendar-card-body'>
                <img src={process.env.PUBLIC_URL + '/images/calendar.png'} alt="calendar" />
            </div>
    </div>
    </>
    )
         
}
export default CalendarCardComponent;