import React, { useState } from 'react';
import { IoIosArrowDown,IoIosArrowUp } from "react-icons/io";
import '../../CSS/ToDoCardCSS.css'




function ToDoCardComponent(){
    const [examsVisible, setExamsVisible] = useState(false);
    const [examsList] = useState([
        { title: "Math Exam",date:"Tue April 03", completed: false },
        { title: "History Exam",date:"Wed July 06", completed: false }
    ]);
    const [ProjectsVisible, setProjectsVisible] = useState(false);
    const [ProjectsList] = useState([
        { title: "Math Projects",date:"Tue April 03", completed: false },
        { title: "History Projects",date:"Wed July 06", completed: false },
        { title: "Physics Projects",date:"Wed July 07", completed: false }
    ]);
    const [clickedProjectsButtons, setClickedProjectsButtons] = useState([]);
    const [clickedExamsButtons, setClickedExamsButtons] = useState([]);

    const handleButtonClick = (index, type) => {
        if (type === 'exam') {
            if (clickedExamsButtons.includes(index)) {
                setClickedExamsButtons(clickedExamsButtons.filter(i => i !== index));
            } else {
                setClickedExamsButtons([...clickedExamsButtons, index]);
            }
        } else if (type === 'project') {
            if (clickedProjectsButtons.includes(index)) {
                setClickedProjectsButtons(clickedProjectsButtons.filter(i => i !== index));
            } else {
                setClickedProjectsButtons([...clickedProjectsButtons, index]);
            }
        }
    };


    return (
    <>
    <div className="todo-card">
        <div className="todo-card-item">
            <div className="todo-card-header">
                <p>Exams ({examsList.length})</p>
                <button 
                    onClick={() => setExamsVisible(!examsVisible)} 
                    className="todo-card-header-arrow-up-button"
                >
                    {examsVisible ? <IoIosArrowUp /> : <IoIosArrowDown />}
                </button>
            </div>
            <div className="todo-card-body">
            {
                examsVisible && 
                (
                    <div className='todo-card-list'>
                        {
                            examsList.map(
                                (item, index) => (
                                    <div className='todo-card-list-item'>
                                        <div className='todo-card-list-item-text'>
                                            <p className='todo-card-list-item-date'>
                                                {item.date}
                                            </p>
                                            <p className='todo-card-list-item-title'>
                                                {item.title}
                                            </p>
                                        </div>
                                        <button 
                                            className={`todo-card-list-item-button ${clickedExamsButtons.includes(index) ? 'clicked' : ''}`}
                                            onClick={() => handleButtonClick(index, 'exam')}
                                        >
                                        </button>
                                    </div> 
                                )
                            )
                        }
                        <button className = 'todo-card-list-add-button'>
                            + Add
                        </button>
                    </div>
                )
            }
            
            </div>
            
        </div>
        <div className="todo-card-item">
            <div className="todo-card-header">
                <p>Projects ({ProjectsList.length})</p>
                <button 
                    onClick={() => setProjectsVisible(!ProjectsVisible)} 
                    className="todo-card-header-arrow-up-button"
                >
                    {ProjectsVisible ? <IoIosArrowUp /> : <IoIosArrowDown />}
                </button>
            </div>
            <div className="todo-card-body">
            {
            ProjectsVisible && 
            (
                <div className='todo-card-list'>
                    {
                        ProjectsList.map(
                            (item, index) => (
                                <div className='todo-card-list-item'>
                                    <div className='todo-card-list-item-text'>
                                        <p className='todo-card-list-item-date'>
                                            {item.date}
                                        </p>
                                        <p className='todo-card-list-item-title'>
                                            {item.title}
                                        </p>
                                    </div>
                                    <button 
                                        className={`todo-card-list-item-button ${clickedProjectsButtons.includes(index) ? 'clicked' : ''}`}
                                        onClick={() => handleButtonClick(index, 'project')}
                                    >
                                    </button>
                                </div> 
                            )
                        )
                    }
                </div>
            )
            }
            </div>
        </div>
    </div> 
    </>
    );
    
}
export default ToDoCardComponent;