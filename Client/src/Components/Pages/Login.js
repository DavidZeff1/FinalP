import { useState } from "react";
import { useNavigate } from "react-router-dom"; 
import "../../CSS/login.css";

function Login() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const navigate = useNavigate(); 

  async function handleSignIn() {
    // await fetch("http://localhost:5000/login", {
    //   method: "POST",
    //   headers: { "Content-Type": "application/json" },
    //   body: JSON.stringify({ email, password }),
    // });

    navigate("/"); 
  }

  return (
    <div className="login-container">
      <div className="login-type">Student Login</div>
      <div className="title">Welcome</div>
      <div className="description">Please Enter Your Details</div>

      <input
        className="email-input"
        type="email"
        value={email}
        onChange={(e) => setEmail(e.target.value)}
      />

      <input
        className="password-input"
        type="password"
        value={password}
        onChange={(e) => setPassword(e.target.value)}
      />

      <button onClick={handleSignIn}>Sign In</button>
    </div>
  );
}

export default Login;
