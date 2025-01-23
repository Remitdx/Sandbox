import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['preview']

  drag(event) {
    //console.log(event.clientX);
    //console.log(event.clientY);
    console.log(this.previewTarget.style.backgroudPosition);
  }

  zoom(event) {
    console.log('zoooooom');
    event.preventDefault;
  }
}
