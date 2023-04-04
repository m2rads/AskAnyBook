import React from "react";
import ReactDOM from "react-dom";
import AskThisBook from "./components/AskThisBook";

document.addEventListener("DOMContentLoaded", function () {
  const node = document.getElementById("book_question");
  if (!node) {
    console.error('Element with ID "book_question" not found');
    return;
  }
  const data = JSON.parse(node.getAttribute("data"));

  ReactDOM.render(<AskThisBook book={data} />, document.getElementById("root"));
});
