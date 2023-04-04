import React, { useState } from "react";
import TextArea from "./primitives/TextArea";
import Button from "./primitives/Button";

function FormContainer(props) {
  const askButtonStyle = {
    label: "Ask Question",
    disable: "false",
  };

  const feelingLuckyStyle = {
    background: "#eee",
    borderColor: "#eee",
    color: "#444",
  };

  const [question, setQuestion] = useState(props.question);
  const [askButton, setAskButton] = useState(askButtonStyle);

  function handleSubmit(event) {
    event.preventDefault();

    fetch("/ask", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("meta[name=csrf-token]").content,
      },
      body: JSON.stringify({ question: question }),
    })
      .then((response) => response.json())
      .then((data) => console.log(data))
      .catch((error) => console.error(error));
  }

  function handleQuestionChange(event) {
    setQuestion(event.target.value);
    event.preventDefault();
  }

  return (
    <form>
      <TextArea value={question} onChange={handleQuestionChange} />
      <div className="buttons">
        <Button label="Ask Question" onClick={handleSubmit} />
        <Button
          label="I'm feeling lucky"
          style={feelingLuckyStyle}
          onClick={handleSubmit}
        />
      </div>
    </form>
  );
}

export default FormContainer;
