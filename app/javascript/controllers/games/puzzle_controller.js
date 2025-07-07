import { Controller } from "@hotwired/stimulus"

const revealAndFadeAway = (target) => {
  target.classList.remove('d-none');
  setTimeout(() => target.classList.add('d-none'), 3000);
}

export default class extends Controller {
  static targets = ['image']

  hint() {
    revealAndFadeAway(this.imageTarget);
  }
}
