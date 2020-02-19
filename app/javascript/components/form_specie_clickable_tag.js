const clickTags = () => {
  const tags = document.querySelectorAll('.clickable');

  if (tags) {
    const toggleActiveClass = (event) => {
      event.currentTarget.classList.toggle('active');
      document.getElementById('tag').value = document.getElementById('tag').value + "," +event.currentTarget.innerText
    };

    const toggleActiveOnClick = (tag) => {
      tag.addEventListener('click', toggleActiveClass);
    };

    tags.forEach(toggleActiveOnClick);
  }
}

export { clickTags };
