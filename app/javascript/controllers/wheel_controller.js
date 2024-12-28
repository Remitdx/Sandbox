import { Controller } from "@hotwired/stimulus"

const findIndice = (newAngle) => {
  const i = (newAngle + 30) % 360;
  let a = i / 60;
  a = (a < 0 ? a + 6 : a);
  return a;
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
    const angle = getComputedStyle(this.wheelTarget, null).getPropertyValue('rotate');
    let newAngle = (parseInt(angle.match(/-?\d*/)) - 60);
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

    const angle = getComputedStyle(this.wheelTarget, null).getPropertyValue('rotate');
    const random = Math.floor(1 + Math.random() * 5) * 60;
    let newAngle = parseInt(angle.match(/-?\d*/)) + random;
    const indice = findIndice(newAngle)

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

    const angle = getComputedStyle(this.wheelTarget, null).getPropertyValue('rotate');
    let newAngle = (parseInt(angle.match(/-?\d*/)) + 60);
    const indice = findIndice(newAngle)


    this.wheelTarget.style.rotate = `${newAngle}deg`;
    this.textTargets[indice].classList.remove('d-none');
    this.backgroundTargets[indice].classList.remove('d-none');
  }
}
