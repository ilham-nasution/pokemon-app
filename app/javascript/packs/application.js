import "bootstrap";
import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Pokemon"],
    typeSpeed: 50,
    loop: false
  });
}

const loadDynamicBannerText2 = () => {
  new Typed('#banner-typed-text2', {
    strings: ["Gotta catch em all!"],
    typeSpeed: 50,
    loop: true
  });
}

const button = document.querySelector(".poke");
const home = document.querySelector("#home");
const plus = document.querySelector("#plus");
button.addEventListener("click", () => {
  home.classList.toggle("home-click");
  plus.classList.toggle("plus-click");
  });

loadDynamicBannerText();
loadDynamicBannerText2();
