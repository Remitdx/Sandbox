import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['previous', 'next', 'screen']

  connect() {
    this.screenTargets[0].classList.remove('d-none');
    this.previousTarget.classList.add("d-none");
  }

  previous() {
    this.previousTarget.classList.remove("d-none");
    this.nextTarget.classList.remove("d-none");
    const active = this.screenTargets.filter(element => !element.classList.value.match("d-none"))[0];

    if (active == this.screenTargets[1]) {
      this.previousTarget.classList.add("d-none");
    }
    active.classList.add("d-none");
    active.previousElementSibling.classList.remove("d-none");
  }

  next() {
    this.previousTarget.classList.remove("d-none");
    this.nextTarget.classList.remove("d-none");
    const active = this.screenTargets.filter(element => !element.classList.value.match("d-none"))[0];

    if (active == this.screenTargets[this.screenTargets.length - 2]) {
      this.nextTarget.classList.add("d-none");
    }
    active.classList.add("d-none");
    active.nextElementSibling.classList.remove("d-none");
  }
}
