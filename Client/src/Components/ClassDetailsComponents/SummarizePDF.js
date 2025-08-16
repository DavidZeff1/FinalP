import React, { useState } from "react";
import "../../CSS/SummarizePDF.css";

export default function SummarizePDF() {
  const [selectedFile, setSelectedFile] = useState(null);
  const [summaryHtml, setSummaryHtml] = useState("");

  // Handle file input change
  const handleFileChange = (e) => {
    setSelectedFile(e.target.files[0]);
  };

  // Submit the file and get back the raw summary with delimiters
  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!selectedFile) return;

    const formData = new FormData();
    formData.append("file", selectedFile);

    const res = await fetch("http://localhost:5000/handleSummarizeFile", {
      method: "POST",
      body: formData,
    });
    const { result } = await res.json();
    setSummaryHtml(formatDelimitedText(result));
  };

  // Parse the AI's delimited output into HTML
  const formatDelimitedText = (raw) => {
    if (!raw) return "";

    // 1) Split by section delimiter '%'
    const parts = raw.split("%").filter((part) => part.trim() !== "");

    // 2) The first part is the title prefixed by '@'
    const titlePart = parts[0].trim();
    const title = titlePart.startsWith("@") ? titlePart.slice(1) : titlePart;

    let html = `<h1>${title}</h1>`;

    // 3) Process each subsequent section
    parts.slice(1).forEach((section) => {
      const sec = section.trim();
      if (!sec) return;
      const titleMatch = sec.match(/^#([^+\n]+)/);
      const sectionTitle = titleMatch ? titleMatch[1].trim() : "";
      html += `<h2>${sectionTitle}</h2>`;

      const bullets = sec
        .split("+")
        .slice(1)
        .map((b) => b.trim())
        .filter((b) => b !== "");

      if (bullets.length) {
        html += "<ul>";
        bullets.forEach((b) => {
          html += `<li>${b}</li>`;
        });
        html += "</ul>";
      }
    });

    return html;
  };

  return (
    <div className="summarize-container">
      <form onSubmit={handleSubmit}>
        <input type="file" onChange={handleFileChange} />
        <button type="submit">Submit</button>
      </form>

      <div
        className="summary"
        dangerouslySetInnerHTML={{ __html: summaryHtml }}
      />
    </div>
  );
}
