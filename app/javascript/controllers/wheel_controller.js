import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['wheel', 'text']

  previous() {
    this.textTargets.forEach(element => {
      element.classList.add('d-none');
    });
    const angle = getComputedStyle(this.wheelTarget, null).getPropertyValue('rotate');
    let newAngle = (parseInt(angle.match(/-?\d*/)) - 60);
    this.wheelTarget.style.rotate = `${newAngle}deg`;
  }

  random() {
    this.textTargets.forEach(element => {
      element.classList.add('d-none');
    });
    const angle = getComputedStyle(this.wheelTarget, null).getPropertyValue('rotate');
    const random = Math.floor(1 + Math.random() * 5) * 60;
    let newAngle = parseInt(angle.match(/-?\d*/)) + random;
    this.wheelTarget.style.rotate = `${newAngle}deg`;
  }

  next() {
    this.textTargets.forEach(element => {
      element.classList.add('d-none');
    });
    const angle = getComputedStyle(this.wheelTarget, null).getPropertyValue('rotate');
    let newAngle = (parseInt(angle.match(/-?\d*/)) + 60);
    this.wheelTarget.style.rotate = `${newAngle}deg`;
  }

  text() {
    const angle = getComputedStyle(this.wheelTarget, null).getPropertyValue('rotate');
    const i = (parseInt(angle.match(/-?\d*/)) + 30) % 360;
    let a = i / 60;
    a = (a < 0 ? a + 6 : a);
    this.textTargets[a].classList.remove('d-none');
  }
}
