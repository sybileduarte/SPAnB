import swal from 'sweetalert';

const initSweetalert = (selector) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal({
        title: "Are you sure you ?",
        text: "Once deleted, you will not be able to recover this!",
        icon: "warning",
        buttons: true,
        dangerMode: true,
      })
      .then((willDelete) => {
        if (willDelete) {
          swal("It was successfully deleted", {
            icon: "success",
          });
          setTimeout(function(){
            const link = document.querySelector('#delete-link');
            console.log(link)
            link.click();
          }, 2000);
        } else {
          swal("You're right to keep it!");
        }
      });
    });
  }
};

export { initSweetalert };
