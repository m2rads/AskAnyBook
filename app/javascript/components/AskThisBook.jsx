import React from "react";
import BookCover from "./common/BookCover";
import FormContainer from "./common/FormContainer";
import "../styles/styles.css";

const AskTheBook = (props) => (
  <div>
    <div className="header">
      <div className="logo">
        <BookCover url={"/assets/getting-real-cover.png"} />
        <h1>Ask This Book</h1>
      </div>
      <div className="main">
        <p className="credits">Getting Real</p>
        <FormContainer question={props.book.question_text} />
      </div>
    </div>
    <Footer />
  </div>
);

export default AskTheBook;
