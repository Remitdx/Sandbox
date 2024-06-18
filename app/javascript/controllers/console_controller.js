import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['console', 'blur', 'field']

  open(key) {
    key.preventDefault()
    this.consoleTarget.classList.remove('d-none');
    this.blurTarget.classList.remove('d-none');
    this.fieldTarget.focus();
  }
}
