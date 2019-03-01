import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Find the housekeeper of your dreams", "Enjoy a world of service excellence"],
    typeSpeed: 80,
    loop: true
  });
}

export { loadDynamicBannerText };

