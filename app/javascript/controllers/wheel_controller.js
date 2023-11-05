import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['wheel', 'text']

  previous() {
    this.textTargets.forEach(element => {
      element.classList.add('d-none');
    });
    const angle = getComputedStyle(this.wheelTarget, null).getPropertyValue('rotate');
    let newAngle = (parseInt(angle.match(/-?\d*/)) - 45);
    newAngle = newAngle - newAngle % 45;
    this.wheelTarget.style.rotate = `${newAngle}deg`;
  }

  random() {
    this.textTargets.forEach(element => {
      element.classList.add('d-none');
    });
    const angle = getComputedStyle(this.wheelTarget, null).getPropertyValue('rotate');
    let newAngle = (parseInt(angle.match(/-?\d*/)) + (Math.random() + 0.1) * 450);
    newAngle = newAngle - newAngle%45;
    this.wheelTarget.style.rotate = `${newAngle}deg`;
  }

  next() {
    this.textTargets.forEach(element => {
      element.classList.add('d-none');
    });
    const angle = getComputedStyle(this.wheelTarget, null).getPropertyValue('rotate');
    let newAngle = (parseInt(angle.match(/-?\d*/)) + 45);
    newAngle = newAngle - newAngle % 45;
    this.wheelTarget.style.rotate = `${newAngle}deg`;
  }

  text() {
    const angle = getComputedStyle(this.wheelTarget, null).getPropertyValue('rotate');
    const i = parseInt(angle.match(/-?\d*/))%360;
    let a = i/45;
    a = (a < 0 ? a + 8 : a);
    console.log(i, a);
    this.textTargets[a].classList.remove('d-none');
  }
}
