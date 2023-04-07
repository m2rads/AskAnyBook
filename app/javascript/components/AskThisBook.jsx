import React from "react";
import BookCover from "./common/BookCover";
import FormContainer from "./common/FormContainer";
import Footer from "./common/primitives/Footer";
import gettingReal from "../assets/getting-real-cover.png";

const AskThisBook = (props) => (
  <div>
    <div className="header">
      <div className="logo">
        <BookCover url={gettingReal} />
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

export default AskThisBook;
