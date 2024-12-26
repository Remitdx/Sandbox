import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['card', 'up', 'down']

  toggle() {
    this.cardTarget.classList.toggle('hidden');
    this.cardTarget.classList.toggle('revealed');
    this.upTarget.classList.toggle('d-none');
    this.downTarget.classList.toggle('d-none');
  }
}
