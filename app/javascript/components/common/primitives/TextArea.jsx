import React from "react";

function TextArea({ value, onChange }) {
  return (
    <div>
      <textarea value={value} onChange={onChange} />
    </div>
  );
}

export default TextArea;
