import React, { useState, useEffect } from "react";
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
  const [animationFinish, setAnimiationFinish] = useState(false);
  const [formSubmitted, setFormSubmitted] = useState(false);

  /**
   * Send the request only when the form submitted state is set to true
   * This will ensure that the request is sent only when the question state
   * has updated
   */
  useEffect(() => {
    if (formSubmitted && question) {
      sendRequest();
      setFormSubmitted(false);
    }
  }, [question, formSubmitted]);

  function sendRequest() {
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
        setAnimiationFinish(false);
      })
      .catch((error) => console.error(error));
  }

  function handleAskSubmit(event) {
    event.preventDefault();
    setFormSubmitted(true);
  }

  function handleFeelingLuckySubmit(event) {
    event.preventDefault();

    const options = [
      "How to build and deliver software faster and more efficiently?",
      "How to get feedback from end users?",
      "How do I decide what kind of business I should start?",
    ];
    const random = Math.floor(Math.random() * options.length);
    setQuestion(options[random]);
    setFormSubmitted(true);
  }

  function handleAskAnotherQuestion(event) {
    event.preventDefault();

    setAskButton({
      label: "Ask question",
      disable: "false",
    });

    setAnswer("");
  }

  function handleQuestionChange(event) {
    setQuestion(event.target.value);
    event.preventDefault();
  }

  function handleAnimationState() {
    console.log("this function is called ");
    setAnimiationFinish(true);
  }

  return (
    <div>
      <form>
        <TextArea value={question} onChange={handleQuestionChange} />
        <div className="buttons">
          {answer ? null : (
            <>
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
            </>
          )}
        </div>
      </form>
      {answer ? (
        <>
          <ShowText animationState={handleAnimationState} text={answer} />
          {animationFinish ? (
            <div style={{ textAlign: "left" }}>
              <Button
                label="Ask another question"
                onClick={handleAskAnotherQuestion}
              />
            </div>
          ) : null}
        </>
      ) : null}
    </div>
  );
}

export default FormContainer;
