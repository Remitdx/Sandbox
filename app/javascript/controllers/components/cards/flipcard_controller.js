import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['flipcard', 'card', 'cardfront', 'cardback']

  connect() {
    this.cardTarget.style.height = "100vh"
    setTimeout(() => {
      if (this.cardfrontTarget) {
        this.cardTarget.style.height = `${this.cardfrontTarget.getBoundingClientRect().height }px`;
      }
    }, 100);
  }

  fliptoback() {
    this.cardbackTarget.style.maxHeight = `${this.cardfrontTarget.getBoundingClientRect().height}px`;
    this.cardTarget.style.height = `${this.cardbackTarget.getBoundingClientRect().height}px`;
    this.flipcardTarget.classList.toggle('flipped');
  }

  fliptofront() {
    this.cardTarget.style.height = `${this.cardfrontTarget.getBoundingClientRect().height}px`;
    this.flipcardTarget.classList.toggle('flipped');
  }
}
