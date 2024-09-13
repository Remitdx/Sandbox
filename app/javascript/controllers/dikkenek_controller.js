import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["start", "end", "characters", "quotes"]

  radioButtons(e) {
    e.target.nextElementSibling.checked = true;
    this.charactersTargets.forEach(character => {
        if ( character.nextElementSibling.checked == false ) {
          character.classList.remove("dikkenek-selected");
        }
    });
    e.target.classList.add("dikkenek-selected");
  }

  previous() {
    console.log('PREVIOUS');
  }

  next() {
    console.log('NEXT');
  }

  connect() {
    this.startTarget.value = Date.now()
  }

  submitForm() {
    this.endTarget.value = Date.now()
  }
}
