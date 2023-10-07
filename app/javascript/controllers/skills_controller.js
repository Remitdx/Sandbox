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
    this.btnclassicTarget.classList.add('selected');
    this.btnradarTarget.classList.remove('selected');
  }

  radar() {
    this.classicTargets.forEach(element => {
      element.classList.add('d-none');
    });
    this.radarTargets.forEach(element => {
      element.classList.remove('d-none');
    });
    this.btnclassicTarget.classList.remove('selected');
    this.btnradarTarget.classList.add('selected');
  }
}
