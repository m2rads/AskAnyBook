import React from "react";
import { createRoot } from "react-dom/client";
import AskThisBook from "./components/AskThisBook";

const container = document.getElementById("root");
const root = createRoot(container);

document.addEventListener("DOMContentLoaded", () => {
  const node = document.getElementById("book_question");
  const data = JSON.parse(node.getAttribute("data"));
  root.render(<AskThisBook book={data} />);
});
