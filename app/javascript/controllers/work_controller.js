import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['card', 'up', 'down']

  toggle() {
    this.cardTarget.classList.toggle('reveal');
    this.upTarget.classList.toggle('d-none');
    this.downTarget.classList.toggle('d-none');
  }
}
