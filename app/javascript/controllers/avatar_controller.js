import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['bg', 'lul']

  bgtolul() {
    this.bgTarget.classList.add('go-right');
    this.lulTarget.classList.add('go-right');
    this.bgTarget.classList.remove('go-left');
    this.lulTarget.classList.remove('go-left');
  }

  lultobg() {
    this.bgTarget.classList.add('go-left');
    this.lulTarget.classList.add('go-left');
    this.bgTarget.classList.remove('go-right');
    this.lulTarget.classList.remove('go-right');
  }

  animationend() {
    this.bgTarget.classList.toggle('backward');
    this.lulTarget.classList.toggle('backward');
  }
}
