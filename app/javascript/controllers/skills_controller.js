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
    this.btnclassicTarget.classList.add('bg-complementary');
    this.btnradarTarget.classList.remove('bg-complementary');
  }

  radar() {
    this.classicTargets.forEach(element => {
      element.classList.add('d-none');
    });
    this.radarTargets.forEach(element => {
      element.classList.remove('d-none');
    });
    this.btnclassicTarget.classList.remove('bg-complementary');
    this.btnradarTarget.classList.add('bg-complementary');
  }
}
