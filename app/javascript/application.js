import React from "react";
import ReactDOM from "react-dom";
import AskThisBook from "./components/AskThisBook";

document.addEventListener("DOMContentLoaded", () => {
  const node = document.getElementById("book_question");
  const data = JSON.parse(node.getAttribute("data"));
  ReactDOM.render(
    <AskThisBook book={data} />,
    document.body.appendChild(document.createElement("div"))
  );
});
