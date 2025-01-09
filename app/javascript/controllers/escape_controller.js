import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['']

  connect() {
    console.log('yop !');
  }

  move(event) {
    console.log(event.key);
  }
}
