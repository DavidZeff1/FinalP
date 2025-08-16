import React, { useState} from "react";
import "../../CSS/SummarizePDF.css";
const TestPDF = () => {
  const [SelectedFile, setFile] = useState(null);
  const [summary,setSummary] = useState(null)

  const fileChange = (event) => {
    const file = event.target.files[0];
    setFile(file);
    console.log(SelectedFile);
  };

  const sendFile = async (e) => {
    e.preventDefault();

    const payLoad = new FormData();

    payLoad.append("file", SelectedFile);

    const response = await fetch("http://localhost:5000/handleTestFile", {
      method: "POST",
      body: payLoad,
    });

    const response2 = await response.json();
    setSummary(response2.result)

  };

  return (
    <div className="summarize-conatiner">
      <form>
        <input type="file" onChange={fileChange} />
        <button onClick={sendFile}> Submit</button>
      </form>
      <div className="summary">
        <p>{summary}</p>
      </div>
      
    </div>
  );
};

export default TestPDF;