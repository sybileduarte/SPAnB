const clickTags = () => {
  const tags = document.querySelectorAll('.clickable');

  if (tags) {
    const updateValueInput = (tag) => {
      if (tag.classList.contains("active")) {
          document.getElementById('tag').value = document.getElementById('tag').value + "," + tag.innerText
        };
    };

    const toggleActiveClass = (event) => {
      document.getElementById('tag').value = ""
      event.currentTarget.classList.toggle('active');
      tags.forEach(updateValueInput)
    };

    const toggleActiveOnClick = (tag) => {
      tag.addEventListener('click', toggleActiveClass);
    };

    tags.forEach(toggleActiveOnClick);
  }
}

export { clickTags };
