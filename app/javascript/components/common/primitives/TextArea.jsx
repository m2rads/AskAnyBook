import React from "react";

function TextArea({ value, onChange }) {
  console.log(value);
  return (
    <div>
      <textarea value={value} onChange={onChange} />
    </div>
  );
}

export default TextArea;
