import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["I want to rent a labrador in Lille.", "I want to rent a labrador in Paris.", "I want to rent a husky anywhere."],
    typeSpeed: 70,
    loop: true
  });
}

export { loadDynamicBannerText };
