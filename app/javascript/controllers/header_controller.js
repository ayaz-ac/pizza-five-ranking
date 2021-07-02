import { Controller } from "stimulus";

export default class extends Controller {
  openHamburger() {
    let hamburgerMenu = document.querySelector("#navbar-collapse");
    hamburgerMenu.classList.toggle("hidden");
    hamburgerMenu.classList.toggle("flex");
  }
}
