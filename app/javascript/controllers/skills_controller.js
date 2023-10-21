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
    this.btnclassicTarget.classList.add('bg-sunset');
    this.btnradarTarget.classList.remove('bg-sunset-r');
  }

  radar() {
    this.classicTargets.forEach(element => {
      element.classList.add('d-none');
    });
    this.radarTargets.forEach(element => {
      element.classList.remove('d-none');
    });
    this.btnclassicTarget.classList.remove('bg-sunset');
    this.btnradarTarget.classList.add('bg-sunset-r');
  }
}
