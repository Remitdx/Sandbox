import { Controller } from "@hotwired/stimulus"

const getCoordinates = (element) => {
  const x = element.offsetTop / 32;
  const y = element.offsetLeft / 32;
  return [x, y]
}

export default class extends Controller {
  static targets = ['up', 'down', 'left', 'right', 'grid', 'character', 'submit']

  move(event) {
    if (event.key == "ArrowUp" || event.key == "ArrowDown" || event.key == "ArrowLeft" || event.key == "ArrowRight") {
      this.characterTarget.classList.remove('up', 'down', 'left', 'right');
    }
    const coordinates = getCoordinates(this.characterTarget);

    switch(event.key) {
      case "ArrowUp":
        this.upTarget.classList.add('pressed');
        this.characterTarget.classList.add('up');
        const nextUp = document.getElementById(`${coordinates[0] - 1}-${coordinates[1]}`);

        if (nextUp.classList.contains('path')) {
          this.characterTarget.style.top = `${this.characterTarget.offsetTop - 32}px`;
        }
        break;
      case "ArrowDown":
        this.downTarget.classList.add('pressed');
        this.characterTarget.classList.add('down');
        const nextDown = document.getElementById(`${coordinates[0] + 1}-${coordinates[1]}`);

        if (nextDown.classList.contains('path')) {
          this.characterTarget.style.top = `${this.characterTarget.offsetTop + 32}px`;
        }
        break;
      case "ArrowLeft":
        this.leftTarget.classList.add('pressed');
        this.characterTarget.classList.add('left');
        const nextLeft = document.getElementById(`${coordinates[0]}-${coordinates[1] - 1}`);

        if (nextLeft.classList.contains('path')) {
          this.characterTarget.style.left = `${this.characterTarget.offsetLeft - 32}px`;
        }
        break;
      case "ArrowRight":
        this.rightTarget.classList.add('pressed');
        this.characterTarget.classList.add('right');
        const nextRight = document.getElementById(`${coordinates[0]}-${coordinates[1] + 1}`);

        if (nextRight.classList.contains('path')) {
          this.characterTarget.style.left = `${this.characterTarget.offsetLeft + 32}px`;
        }
        break;
    };

    const newCoordinates = getCoordinates(this.characterTarget);
    console.log(newCoordinates);
    if (newCoordinates[0] == 2 && newCoordinates[1] == 11) {
      this.submitTarget.click();
    }
  }

  keyup(event) {
    this.upTarget.classList.remove('pressed');
    this.downTarget.classList.remove('pressed');
    this.leftTarget.classList.remove('pressed');
    this.rightTarget.classList.remove('pressed');
  }
}
