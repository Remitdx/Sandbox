import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['wheel', 'text']

  previous() {
    const angle = getComputedStyle(this.wheelTarget, null).getPropertyValue('rotate');
    console.log(angle);
    const newAngle = (parseInt(angle.match(/\d*/)) + 315) % 360;
    console.log(newAngle)
    this.wheelTarget.style.rotate = `${newAngle}deg`;
  }

  next() {
    const angle = getComputedStyle(this.wheelTarget, null).getPropertyValue('rotate');
    const newAngle = (parseInt(angle.match(/\d*/)) + 45) % 360;
    this.wheelTarget.style.rotate = `${newAngle}deg`;
  }

}
