const showFormReview = () => {
  const btnReviews = document.querySelectorAll(".add-review")
  if (btnReviews){
    btnReviews.forEach((btn) => {
      btn.addEventListener("click", (event) => {
        event.currentTarget.parentElement.parentElement.lastElementChild.classList.toggle("d-none")
      })
    })
  };
};

export { showFormReview };
