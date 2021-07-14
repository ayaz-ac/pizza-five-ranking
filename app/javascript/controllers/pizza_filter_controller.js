import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["title", "pizzas"];

  search() {
    this.fetchPizza(`/?title=${this.titleTarget.value}`);
  }

  filter(event) {
    this.fetchPizza(`/?sauce=${event.target.selectedOptions[0].value}`);
  }

  fetchPizza(url) {
    return fetch(url, {
      headers: { accept: "application/json" },
    })
      .then((response) => response.json())
      .then((data) => {
        let pizzaHTML = "";
        let user = data['user'];
        let pizzas = data['pizzas'];
        pizzas.forEach((pizza) => {
          pizzaHTML += this.pizzaCardTemplate(pizza, user);
        });
        this.pizzasTarget.innerHTML = pizzaHTML;
      });
  }

  pizzaCardTemplate(pizza, user) {
    let topDiv = `
    <div class="min-w-full rounded-md shadow-lg overflow-hidden mt-5 lg:max-w-2xl" data-controller="pizza-rating">
      <div class="md:flex">
        <div class="md:flex-shrink-0 bg-gray-50">
          <img src="${
            pizza.img_url
          }" class="h-80 w-full object-cover md:h-full md:w-48" alt="${pizza.title.toLowerCase()}"/>
        </div>
        <div class="p-8">
          <div class="flex flex-row mb-5 items-center">`;

    let bottomDiv = `</div>
          <div class="tracking-wide text-sm text-indigo-500 font-semibold">${pizza.sauce.toUpperCase()}</div>
          <span class="block mt-1 text-lg leading-tight font-medium text-black">${
            pizza.title
          }</span>
          <p class="mt-2 text-gray-500">${pizza.composition}</p>
        </div>
      </div>
    </div>`;

    let middleDiv = "";
    if (user.signedIn) {
      // Filter ratings only if necessary
      if (pizza.ratings.length > 0 ) {
        pizza.ratings = pizza.ratings.filter(rating => rating.user_id === user.id);
      }

      middleDiv = `
      <input type="hidden" value="${pizza.id}" data-pizza-rating-target="pizzaId">
      <button class="btn-minus w-10 bg-pink-500 disabled:bg-gray-200 disabled:text-gray-500 hover:bg-pink-600 rounded-full text-lg text-white font-semibold" data-action="click->pizza-rating#decrease" ${(pizza.score === 0) || (( pizza.ratings.length > 0) && (pizza.ratings[0].value === '-')) ? 'disabled' : ''}>-</button>
      <span class="text-lg text-gray-800 mx-3 font-bold" data-pizza-rating-target="score">${pizza.score}</span>
      <button class="btn-plus w-10 bg-blue-500 disabled:bg-gray-200 disabled:text-gray-500 hover:bg-blue-600 rounded-full text-lg text-white font-semibold" data-action="click->pizza-rating#increase" ${((pizza.ratings.length > 0) && (pizza.ratings[0].value === '+')) ? 'disabled' : ''}>+</button>
      `;
    } else {
      middleDiv = `
      <span class="text-lg text-gray-800 mx-3 font-bold" data-pizza-rating-target="score">${pizza.score}</span>
      `;
    }

    return topDiv + middleDiv + bottomDiv;
  }
}
