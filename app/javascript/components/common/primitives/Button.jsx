import React from "react";

function Button(props) {
  return (
    <button
      style={props?.style}
      onClick={props.onClick}
      disabled={props?.disabled}
    >
      {props.label}
    </button>
  );
}

export default Button;
