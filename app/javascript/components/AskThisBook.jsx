import React from "react";
import BookCover from "./common/BookCover";
import "../styles/styles.css";

const AskTheBook = (props) => (
  <div>
    <div className="header">
      <div className="logo">
        <BookCover url={"/assets/getting-real-cover.png"} />
        <h1>Ask This Book</h1>
      </div>
    </div>
  </div>
);

export default AskTheBook;
