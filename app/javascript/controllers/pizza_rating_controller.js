import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["score", "pizzaId"];

  increase() {
    this.updateRating("+");
  }

  decrease() {
    this.updateRating("-");
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
