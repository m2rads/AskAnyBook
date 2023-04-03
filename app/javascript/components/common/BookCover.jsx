import React, { lazy, Suspense } from "react";
const Image = lazy(() => import("./primitives/Image"));

/**
 * This component is designed to lazily load the cover image using the `lazy`
 * function provided by React. It requires an `Image` component that accepts a
 * `src` prop, which should be a string rep.
 *
 * The component also displays a fallback loading message using the `Suspense`
 * component if the image is not yet loaded.
 */

function BookCover(props) {
  return (
    <div>
      <Suspense fallback={<div> Loading... </div>}>
        <Image src={props.url} alt="Getting Real Book cover" />
      </Suspense>
    </div>
  );
}

export default BookCover;
