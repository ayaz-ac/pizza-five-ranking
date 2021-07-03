import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["score"];

  increase() {
    let score = parseInt(this.scoreTarget.innerHTML, 10);
    score++;
    this.scoreTarget.innerHTML = score;
  }

  decrease() {
    let score = parseInt(this.scoreTarget.innerHTML, 10);
    score--;
    if (score < 0) score = 0;
    this.scoreTarget.innerHTML = score;
  }
}
