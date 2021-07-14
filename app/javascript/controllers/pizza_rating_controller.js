import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["score", "pizzaId"];

  decrease(e) {
    this.updateRating("-");
    this.disableButton(e,'btn-plus');
  }

  increase(e) {
    this.updateRating("+");
    this.disableButton(e,'btn-minus');
  }

  navigateToLogin(e) {
    window.location.href = '/users/sign_in';
  }

  disableButton(e, otherBtn) {
    e.preventDefault();
    // Disable the clicked button
    e.target.disabled = true;
    // Enable the other button
    e.target.parentElement.querySelector(`.${otherBtn}`).disabled = false;
  }

  updateRating(rating) {
    const data = {
      pizza_id: this.pizzaIdTarget.value,
      rating: rating,
    };
    return fetch("/ratings", {
      method: "POST",
      headers: {
        accept: "application/json",
        "X-CSRF-Token": document
          .querySelector('meta[name="csrf-token"]')
          .getAttribute("content"),
      },
      body: JSON.stringify(data),
    })
      .then((response) => response.json())
      .then((data) => {
        this.scoreTarget.innerHTML = data['score']
      });
  }
}
