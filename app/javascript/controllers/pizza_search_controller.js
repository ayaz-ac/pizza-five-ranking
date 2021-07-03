import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["query", "pizzas"];

  // Source: https://medium.com/swlh/build-a-dynamic-search-with-stimulus-js-and-rails-6-56b537a44579

  search() {
    fetch(`/?query=${this.queryTarget.value}`, {
      headers: { accept: "application/json" },
    })
      .then((response) => response.json())
      .then(data => {
        let pizzaHTML = "";
        let pizzas = Object.values(data)[0];
        pizzas.forEach(pizza => {
          pizzaHTML += this.pizzaCardTemplate(pizza);
        });
        this.pizzasTarget.innerHTML = pizzaHTML;
      });
  }

  pizzaCardTemplate(pizza) {
    return `
    <div class="min-w-full rounded-md shadow-lg overflow-hidden mt-5 lg:max-w-2xl" data-controller="pizza-rating">
      <div class="md:flex">
        <div class="md:flex-shrink-0 bg-gray-50">
          <img src="${pizza.img_url}" class="h-80 w-full object-cover md:h-full md:w-48" alt="${pizza.title.toLowerCase()}"/>
        </div>
        <div class="p-8">
          <div class="flex flex-row mb-5 items-center">
            <button class="w-10 bg-pink-500 hover:bg-pink-600 rounded-full text-lg text-white font-semibold" data-action="click->pizza-rating#decrease">-</button>
            <span class="text-lg text-gray-800 mx-3" data-pizza-rating-target="score">0</span>
            <button class="w-10 bg-blue-500 hover:bg-blue-600 rounded-full text-lg text-white font-semibold" data-action="click->pizza-rating#increase">+</button>
          </div>
          <div class="tracking-wide text-sm text-indigo-500 font-semibold">${pizza.sauce.toUpperCase()}</div>
          <span class="block mt-1 text-lg leading-tight font-medium text-black">${pizza.title}</span>
          <p class="mt-2 text-gray-500">${pizza.composition}</p>
        </div>
      </div>
    </div>`;
  }
}
