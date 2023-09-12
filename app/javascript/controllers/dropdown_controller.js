import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['navigation', 'button']

  toggle() {
    this.buttonTargets.forEach(element => {
      element.classList.toggle('d-none');
    });
    this.navigationTarget.classList.toggle('d-none');
  }
}
