import HomeComponent from "./Components/Pages/HomeComponent";
import ClassesComponent from "./Components/Pages/ClassesComponent";
import ProfileComponent from "./Components/Pages/ProfileComponent";
import GamesComponent from "./Components/Pages/GamesComponent";
import CalendarComponent from "./Components/Pages/CalendarComponent";
import OthelloComponent from "./Components/GamesPageComponents/OthelloComponent"
import ClassDetailPage from "./Components/Pages/ClassDetailPage";
import ContentGeneratorPage from "./Components/Pages/ContentGeneratorPage";
import Login from "./Components/Pages/Login";
import { BrowserRouter, Routes, Route } from "react-router-dom";

function App() {
  return  (
          <BrowserRouter>
            <Routes>
              <Route path="Login" element={<Login />} />
              <Route path="/" element={<HomeComponent />} />
              <Route path="/ContentGeneratorPage" element={<ContentGeneratorPage />} />
              <Route path="/classes" element={<ClassesComponent />} />
              <Route path="/profile" element={<ProfileComponent />} />
              <Route path="/games" element={<GamesComponent />} />
              <Route path="/othello" element={<OthelloComponent />} />
              <Route path="/CalendarComponent" element={<CalendarComponent />} />
              <Route path="/classes/:classId" element={<ClassDetailPage />}/>
            </Routes>
          </BrowserRouter>
          );
}

export default App;
