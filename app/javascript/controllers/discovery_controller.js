import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['field', 'char']

  move(e) {
    this.charTarget.style.opacity = 1
    const charSize = 40;
    const charOffset = charSize / 2;

    //current position of char center
    const charX = this.charTarget.offsetLeft + charOffset;
    const charY = this.charTarget.offsetTop + charOffset;

    // get the clic event position corrected with field position and character offset
    const fieldX = this.fieldTarget.offsetLeft;
    const fieldY = this.fieldTarget.offsetTop;
    const moveToX = e.pageX - fieldX - charOffset;
    const moveToY = e.pageY - fieldY - charOffset;

    // calculate the angle for the character to face his target
    const distanceX = moveToX - charX + charOffset;
    const distanceY = moveToY - charY + charOffset;
    const angleRadians = Math.atan2(distanceY, distanceX);
    const angle = ((angleRadians * 180) / Math.PI) + 90;
    this.charTarget.style.rotate = `${angle}deg`;

    // next value of char top-left corner
    this.charTarget.style.top = `${moveToY}px`;
    this.charTarget.style.left = `${moveToX}px`;
  }

  reveal(e) {
    console.log(e)
    const charSize = 40;
    const charOffset = charSize / 2;
    const bubbleOffset = 100;
    const charX = this.charTarget.offsetLeft;
    const charY = this.charTarget.offsetTop;
    const bubble = document.createElement('span');
    bubble.style.left = `${charX - bubbleOffset + charOffset}px`;
    bubble.style.top = `${charY - bubbleOffset + charOffset}px`;
    this.fieldTarget.appendChild(bubble);
  }
}
