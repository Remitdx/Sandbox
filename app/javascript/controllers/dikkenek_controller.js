import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["start", "end", "quotes", "steps", "characters"]

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
    let index = this.stepsTargets.findIndex(step => step.classList.contains("active"));
    this.stepsTargets[index].classList.remove("active");
    this.stepsTargets[(index + 9) % 10].classList.add("active");
    this.quotesTargets[index].classList.add("d-none");
    this.quotesTargets[(index + 9) % 10].classList.remove("d-none");
  }

  next() {
    let index = this.stepsTargets.findIndex(step => step.classList.contains("active"));
    this.stepsTargets[index].classList.remove("active");
    this.stepsTargets[(index + 1) % 10].classList.add("active");
    this.quotesTargets[index].classList.add("d-none");
    this.quotesTargets[(index + 1) % 10].classList.remove("d-none");
  }

  connect() {
    this.startTarget.value = Date.now()
  }

  submitForm() {
    this.endTarget.value = Date.now()
  }
}
