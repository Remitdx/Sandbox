import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['up', 'down', 'left', 'right']

  connect() {
    console.log('yop !');
  }

  move(event) {
    switch(event.key) {
      case "ArrowUp":
        this.upTarget.classList.add('pressed');
        break;
      case "ArrowDown":
        this.downTarget.classList.add('pressed');
        break;
      case "ArrowLeft":
        this.leftTarget.classList.add('pressed');
        break;
      case "ArrowRight":
        this.rightTarget.classList.add('pressed');
        break;
    };
  }

  keyup() {
    this.upTarget.classList.remove('pressed');
    this.downTarget.classList.remove('pressed');
    this.leftTarget.classList.remove('pressed');
    this.rightTarget.classList.remove('pressed');
  }
}
