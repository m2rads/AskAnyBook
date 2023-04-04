import React, { useState } from "react";
import TextArea from "./primitives/TextArea";
import Button from "./primitives/Button";
import ShowText from "./ShowText";

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
  const [answer, setAnswer] = useState("");

  function handleAskSubmit(event) {
    event.preventDefault();

    setAskButton({
      label: "Asking...",
      disable: "true",
    });

    fetch("/ask", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("meta[name=csrf-token]").content,
      },
      body: JSON.stringify({ question: question }),
    })
      .then((response) => response.json())
      .then((data) => {
        setAnswer(data.answer);
      })
      .catch((error) => console.error(error));
  }

  function handleFeelingLuckySubmit(event) {
    event.preventDefault();

    setAskButton({
      label: "Asking...",
      disable: "true",
    });
  }

  function handleQuestionChange(event) {
    setQuestion(event.target.value);
    event.preventDefault();
  }

  return (
    <div>
      <form>
        <TextArea value={question} onChange={handleQuestionChange} />
        <div className="buttons">
          <Button
            label={askButton.label}
            onClick={handleAskSubmit}
            disabled={askButton.disable === "true"}
          />
          <Button
            label="I'm feeling lucky"
            style={feelingLuckyStyle}
            onClick={handleFeelingLuckySubmit}
            disabled={askButton.disable === "true"}
          />
        </div>
      </form>
      <ShowText text={answer} />
    </div>
  );
}

export default FormContainer;
