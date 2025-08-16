import React, { useState, useEffect } from "react";
import NavbarComponent from "./NavbarComponent";
import "../../CSS/CalendarComponent.css";

export default function CalendarComponent() {
  const [tasksData, setTasksData] = useState([]);

  useEffect(() => {
    async function fetchTasks() {
      const response = await fetch("http://localhost:5000/api/tasks");
      const data = await response.json();
      setTasksData(data);
    }
    fetchTasks();
  }, []);

  const [month, setMonth] = useState(new Date().getMonth());
  const [year] = useState(new Date().getFullYear());
  const [activeDay, setActiveDay] = useState(null);

  const getDayOfMonth = (day) => new Date(year, month, day);
  const getLastDayOfMonth = () => new Date(year, month + 1, 0);

  function createCurrentMonth() {
    const days = [];
    const firstDayIndex = getDayOfMonth(1).getDay();
    const lastDate = getLastDayOfMonth().getDate();

    // pad leading blanks
    for (let i = 0; i < firstDayIndex; i++) days.push(null);

    // build each day object
    for (let i = 1; i <= lastDate; i++) {
      const currentDate = getDayOfMonth(i);

      // properly parse timestamps
      const filteredTasks = tasksData.filter((task) => {
        const taskDate = new Date(task.date);
        return (
          taskDate.getDate() === currentDate.getDate() &&
          taskDate.getMonth() === currentDate.getMonth() &&
          taskDate.getFullYear() === currentDate.getFullYear()
        );
      });

      days.push({
        day: currentDate.getDate(),
        month: currentDate.getMonth(),
        year: currentDate.getFullYear(),
        tasks: filteredTasks,
      });
    }

    // pad trailing blanks
    const totalCells = days.length <= 35 ? 35 : 42;
    while (days.length < totalCells) days.push(null);

    return days;
  }

  const [daysOfMonth, setDaysOfMonth] = useState(createCurrentMonth());

  useEffect(() => {
    setDaysOfMonth(createCurrentMonth());
  }, [month, year, tasksData]);

  const DaysOfTheWeek = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];
  const MonthsOfTheYear = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  const isToday = (dayObj) => {
    if (!dayObj) return false;
    const today = new Date();
    return (
      dayObj.day === today.getDate() &&
      dayObj.month === today.getMonth() &&
      dayObj.year === today.getFullYear()
    );
  };

  function handleClickShowTasks(day) {
    console.log(day);
    console.log(tasksData);
    const dayId = `${day.year}-${day.month}-${day.day}`;
    setActiveDay(activeDay === dayId ? null : dayId);
  }

  async function generateStudySchedule() {
    const resp = await fetch("http://localhost:5000/api/create-study-schedule");
    const json = await resp.json();

    if (json.success) {
      const tasksResp = await fetch("http://localhost:5000/api/tasks");
      const tasksJson = await tasksResp.json();
      setTasksData(tasksJson);

      if (json.scheduled.length) {
        alert(`Scheduled reviews for:\n• ${json.scheduled.join("\n• ")}`);
      } else {
        alert("Nothing to schedule—your performance is already strong!");
      }
    } else {
      alert("Failed to generate study schedule.");
    }
  }

  return (
    <>
      {activeDay && (
        <div className="overlay" onClick={() => setActiveDay(null)}></div>
      )}
      <NavbarComponent />
      <button className="study-schedule-button" onClick={generateStudySchedule}>
        Generate Study Schedule
      </button>
      <h1>{`${year} ${MonthsOfTheYear[month]}`}</h1>
      <div style={{ justifySelf: "center" }}>
        <button onClick={() => setMonth((prev) => (prev - 1 + 12) % 12)}>
          Previous Month
        </button>
        <button onClick={() => setMonth((prev) => (prev + 1) % 12)}>
          Next Month
        </button>
      </div>

      <h1>Calendar</h1>
      <div className="calendar-container">
        {DaysOfTheWeek.map((day, index) => (
          <div key={index} className="day-header">
            {day}
          </div>
        ))}
        {daysOfMonth.map((day, index) => (
          <div key={index} className={isToday(day) ? "current" : "day"}>
            {day ? day.day : ""}
            {day && (
              <div>
                <button onClick={() => handleClickShowTasks(day)}>
                  Show Tasks
                </button>
              </div>
            )}
            {day &&
              activeDay === `${day.year}-${day.month}-${day.day}` &&
              day.tasks.length > 0 && (
                <div className="tasks-container">
                  <h3>Tasks</h3>
                  {day.tasks.map((task, idx) => (
                    <div key={idx}>{task.description}</div>
                  ))}
                  <button onClick={() => handleClickShowTasks(day)}>
                    Exit
                  </button>
                </div>
              )}
          </div>
        ))}
      </div>
    </>
  );
}
