import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['console', 'blur']

  open() {
    console.log('why waking me up, huh ?!');
    this.consoleTarget.classList.remove('d-none');
    this.blurTarget.classList.remove('d-none');
  }
}
