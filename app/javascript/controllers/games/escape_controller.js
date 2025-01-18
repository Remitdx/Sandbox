import { Controller } from "@hotwired/stimulus"

const getCoordinates = (element) => {
  const x = element.offsetTop / 32;
  const y = element.offsetLeft / 32;
  return [x, y]
}

export default class extends Controller {
  static targets = ['up', 'down', 'left', 'right', 'grid', 'character', 'characterX', 'characterY', 'input', 'submit']

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
    if (newCoordinates[0] == 5 && newCoordinates[1] == 6) {
      this.inputTarget.value = "text";
      this.characterXTarget.value = newCoordinates[1];
      this.characterYTarget.value = newCoordinates[0];
      this.submitTarget.parentElement.parentElement.classList.add('sprite-shiny');
      this.submitTarget.click();
    }
    if (newCoordinates[0] == 2 && newCoordinates[1] == 11) {
      this.inputTarget.value = "room";
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
