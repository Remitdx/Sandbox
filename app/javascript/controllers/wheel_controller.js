import { Controller } from "@hotwired/stimulus"

const findIndice = (angle) => {
  const i = (angle + 30) % 360;
  let a = i / 60;
  const indice = (a < 0 ? a + 6 : a);
  return indice;
}

const authorizedAngle = (angle) => {
  const diff = (angle + 30) % 60;
  return (angle - diff);
}

export default class extends Controller {
  static targets = ['background', 'button', 'wheel', 'text']

  connect() {
    this.textTargets[1].classList.remove('d-none');
  }


  previous() {
    this.textTargets.forEach(element => {
      element.classList.add('d-none');
    });
    this.backgroundTargets.forEach(element => {
      element.classList.add('d-none');
    });

    let angle = parseInt(getComputedStyle(this.wheelTarget, null).getPropertyValue('rotate').match(/-?\d*/));
    angle = authorizedAngle(angle)

    let newAngle = angle - 60;
    const indice = findIndice(newAngle);

    this.wheelTarget.style.rotate = `${newAngle}deg`;
    this.textTargets[indice].classList.remove('d-none');
    this.backgroundTargets[indice].classList.remove('d-none');
  }

  random() {
    this.textTargets.forEach(element => {
      element.classList.add('d-none');
    });
    this.backgroundTargets.forEach(element => {
      element.classList.add('d-none');
    });

    let angle = parseInt(getComputedStyle(this.wheelTarget, null).getPropertyValue('rotate').match(/-?\d*/));
    angle = authorizedAngle(angle)

    const random = Math.floor(1 + Math.random() * 5) * 60;
    let newAngle = angle + random;
    const indice = findIndice(newAngle);

    this.wheelTarget.style.rotate = `${newAngle}deg`;
    this.textTargets[indice].classList.remove('d-none');
    this.backgroundTargets[indice].classList.remove('d-none');
  }

  next() {
    this.textTargets.forEach(element => {
      element.classList.add('d-none');
    });
    this.backgroundTargets.forEach(element => {
      element.classList.add('d-none');
    });

    let angle = parseInt(getComputedStyle(this.wheelTarget, null).getPropertyValue('rotate').match(/-?\d*/));
    angle = authorizedAngle(angle)

    let newAngle = angle + 60;
    const indice = findIndice(newAngle);


    this.wheelTarget.style.rotate = `${newAngle}deg`;
    this.textTargets[indice].classList.remove('d-none');
    this.backgroundTargets[indice].classList.remove('d-none');
  }
}
