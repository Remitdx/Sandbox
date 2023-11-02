import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['card']

  reveal(event) {
    console.log(event);
    console.log('coucou !')
  }
}
