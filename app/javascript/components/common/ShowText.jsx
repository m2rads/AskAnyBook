import React, { useState, useEffect } from "react";

const ShowText = (props) => {
  const [displayText, setDisplayText] = useState("");

  useEffect(() => {
    let timer = null;
    let index = 0;

    const animateText = () => {
      if (index < props.text.length) {
        setDisplayText((prev) => prev + props.text[index]);
        index++;
        timer = setTimeout(animateText, 50);
      }
    };

    animateText();

    return () => {
      clearTimeout(timer);
    };
  }, [props.text]);

  return (
    <div style={{ textAlign: "left" }}>
      <strong> Answer: </strong> {displayText}
    </div>
  );
};

export default ShowText;
