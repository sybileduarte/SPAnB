const bookingForm = document.querySelector('.dayContainer');

const dynamicPrice = () => {
  if (bookingForm) {
    const startDate = document.getElementById('range_start')
    startDate.addEventListener('change', () => {
      const start = parseInt(document.getElementById('range_start').value.split("-")[2])
      const end = parseInt(document.getElementById('range_end').value.split("-")[2])
      if (start && end) {
        const price = parseInt(document.querySelector('.display-price').innerText.split("€")[0])
        document.querySelector('.data-total-price').innerHTML = "Total price: <strong>" + (end - start + 1)*price + " €</strong>"
      };
    });
  };
};

export { dynamicPrice };
