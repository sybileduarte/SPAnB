const selectSpecie = () => {
  const chat = document.getElementById('chat');
  const inputChat = document.getElementById('input-chat');


  if (chat){
    chat.addEventListener("click", (event) => {
      inputChat.classList.toggle("d-none");
      if (!inputChien.classList.contains("d-none")) {
        inputChien.classList.add("d-none");
      }
    });

    const chien = document.getElementById('chien')
    const inputChien = document.getElementById('input-chien')

    chien.addEventListener("click", (event) => {
      inputChien.classList.toggle("d-none");
      if (!inputChat.classList.contains("d-none")) {
        inputChat.classList.add("d-none");
      };
    })
  };
};

export { selectSpecie };
