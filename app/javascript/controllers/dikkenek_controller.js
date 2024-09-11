import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['start', 'end']

  radioButtons(e) {
    e.target.nextElementSibling.checked = true;
  }

  connect() {
    this.startTarget.value = Date.now()
  }

  submitForm() {
    this.endTarget.value = Date.now()
  }
}
