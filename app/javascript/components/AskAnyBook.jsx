import React, { useRef } from "react";
import BookCover from "./common/BookCover";
import FormContainer from "./common/FormContainer";
import "../styles/styles.css";
import Footer from "./common/primitives/Footer";

function AskAnyBook(props) {
  const fileInputRef = useRef(null);

  function uploadHandler(event) {
    event.preventDefault();
    fileInputRef.current.click();
  }

  return (
    <div>
      <div className="header">
        <div className="logo">
          <label style={{ cursor: "pointer" }} htmlFor="fileInput">
            <BookCover url={"/assets/upload-file.png"} />
          </label>
          <input
            id="fileInput"
            type="file"
            style={{ display: "none" }}
            ref={fileInputRef}
          />
          <h1>Ask Any Book</h1>
        </div>
        <div className="main">
          <p className="credits">Getting Real</p>
          <FormContainer />
        </div>
      </div>
      <Footer />
    </div>
  );
}
export default AskAnyBook;
