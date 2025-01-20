import { Controller } from "@hotwired/stimulus"

const getCoordinates = (element) => {
  const x = element.offsetTop / 32;
  const y = element.offsetLeft / 32;
  return [x, y]
}

const triggerSubmit = (coordinates) => {
  if (coordinates[0] == 5 && coordinates[1] == 6 ||
      coordinates[0] == 2 && coordinates[1] == 11 ||
      coordinates[0] == 0 && coordinates[1] == 3 ||
      coordinates[0] == 12 && coordinates[1] == 1 ||
      coordinates[0] == 8 && coordinates[1] == 11 ||
      coordinates[0] == 12 && coordinates[1] == 15 ||
      coordinates[0] == 2 && coordinates[1] == 18 ||
      coordinates[0] == 3 && coordinates[1] == 18 ||
      coordinates[0] == 0 && coordinates[1] == 8 ) {
    return true
  }  else {
    return false
  }
}

export default class extends Controller {
  static targets = ['up', 'down', 'left', 'right', 'character', 'characterX', 'characterY', 'submit']

  move(event) {
    if (event.key == "ArrowUp" || event.key == "ArrowDown" || event.key == "ArrowLeft" || event.key == "ArrowRight") {
      this.characterTarget.classList.remove('character-up', 'character-down', 'character-left', 'character-right');
    }
    const coordinates = getCoordinates(this.characterTarget);

    switch(event.key) {
      case "ArrowUp":
        this.upTarget.classList.add('arrow-pressed');
        this.characterTarget.classList.add('character-up');
        const nextUp = document.getElementById(`${coordinates[0] - 1}-${coordinates[1]}`);

        if (nextUp.classList.contains('sprite-path')) {
          this.characterTarget.style.top = `${this.characterTarget.offsetTop - 32}px`;
        }
        break;
      case "ArrowDown":
        this.downTarget.classList.add('arrow-pressed');
        this.characterTarget.classList.add('character-down');
        const nextDown = document.getElementById(`${coordinates[0] + 1}-${coordinates[1]}`);

        if (nextDown.classList.contains('sprite-path')) {
          this.characterTarget.style.top = `${this.characterTarget.offsetTop + 32}px`;
        }
        break;
      case "ArrowLeft":
        this.leftTarget.classList.add('arrow-pressed');
        this.characterTarget.classList.add('character-left');
        const nextLeft = document.getElementById(`${coordinates[0]}-${coordinates[1] - 1}`);

        if (nextLeft.classList.contains('sprite-path')) {
          this.characterTarget.style.left = `${this.characterTarget.offsetLeft - 32}px`;
        }
        break;
      case "ArrowRight":
        this.rightTarget.classList.add('arrow-pressed');
        this.characterTarget.classList.add('character-right');
        const nextRight = document.getElementById(`${coordinates[0]}-${coordinates[1] + 1}`);

        if (nextRight.classList.contains('sprite-path')) {
          this.characterTarget.style.left = `${this.characterTarget.offsetLeft + 32}px`;
        }
        break;
    };

    const newCoordinates = getCoordinates(this.characterTarget);

    if (triggerSubmit(newCoordinates)) {
      this.characterXTarget.value = newCoordinates[1];
      this.characterYTarget.value = newCoordinates[0];
      this.submitTarget.click();
    }

  }

  keyup() {
    this.upTarget.classList.remove('arrow-pressed');
    this.downTarget.classList.remove('arrow-pressed');
    this.leftTarget.classList.remove('arrow-pressed');
    this.rightTarget.classList.remove('arrow-pressed');
  }
}
