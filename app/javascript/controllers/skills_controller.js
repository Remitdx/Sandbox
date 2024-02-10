import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['btnclassic', 'btnradar', 'classic', 'radar']

  classic() {
    this.classicTargets.forEach(element => {
      element.classList.remove('d-none');
    });
    this.radarTargets.forEach(element => {
      element.classList.add('d-none');
    });
    this.btnclassicTarget.firstElementChild.classList.add('btn-complementary');
    this.btnclassicTarget.firstElementChild.classList.remove('btn-dark');
    this.btnradarTarget.firstElementChild.classList.remove('btn-complementary');
    this.btnradarTarget.firstElementChild.classList.add('btn-dark');

  }

  radar() {
    this.classicTargets.forEach(element => {
      element.classList.add('d-none');
    });
    this.radarTargets.forEach(element => {
      element.classList.remove('d-none');
    });
    this.btnclassicTarget.firstElementChild.classList.remove('btn-complementary');
    this.btnclassicTarget.firstElementChild.classList.add('btn-dark');
    this.btnradarTarget.firstElementChild.classList.add('btn-complementary');
    this.btnradarTarget.firstElementChild.classList.remove('btn-dark');

  }
}
