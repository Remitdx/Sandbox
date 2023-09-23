import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['button', 'item', 'navigation']

  reveal() {
    this.buttonTargets.forEach(element => {
      element.classList.toggle('d-none');
    });
    this.itemTargets.forEach(element => {
      element.classList.remove('close-animation');
      element.classList.add('open-animation');
    });
    this.navigationTarget.classList.remove('d-none');
  }

  hide() {
    this.buttonTargets.forEach(element => {
      element.classList.toggle('d-none');
    });
    this.itemTargets.forEach(element => {
      element.classList.remove('open-animation');
      element.classList.add('close-animation');
    });
  }

  animationend() {
    if(this.itemTargets[0].classList.value.includes('close')) {
      this.navigationTarget.classList.add('d-none');
    }
  }
}
