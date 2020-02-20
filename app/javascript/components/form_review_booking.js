const showFormReview = () => {
  const btnReviews = document.querySelectorAll(".add-review")
  btnReviews.forEach((btn) => {
    btn.addEventListener("click", (event) => {
      event.currentTarget.parentElement.parentElement.parentElement.parentElement.parentElement.children[2].classList.toggle("d-none")
    })
  })
}

export { showFormReview };
