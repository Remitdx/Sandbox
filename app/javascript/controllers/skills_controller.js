import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['btnclassic', 'btnradar', 'classic', 'radar']

  classic() {
    this.classicTarget.classList.remove('d-none');
    this.radarTarget.classList.add('d-none');
    this.btnclassicTarget.classList.add('selected');
    this.btnradarTarget.classList.remove('selected');
  }

  radar() {
    this.classicTarget.classList.add('d-none');
    this.radarTarget.classList.remove('d-none');
    this.btnclassicTarget.classList.remove('selected');
    this.btnradarTarget.classList.add('selected');
  }
}
