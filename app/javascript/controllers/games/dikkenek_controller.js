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
    const index = e.target.parentElement.parentElement.parentElement.id.match(/\d+/)[0] - 1;
    this.stepsTargets[index].classList.add("checked")
  }

  stepper(e) {
    const index = e.target.innerHTML - 1 ;
    this.stepsTargets.forEach(step => {
      step.classList.remove("active");
    });
    this.stepsTargets[index].classList.add("active");
    this.quotesTargets.forEach(quote => {
      quote.classList.add("d-none");
    });
    this.quotesTargets[index].classList.remove("d-none");
  }

  previous() {
    const index = this.stepsTargets.findIndex(step => step.classList.contains("active"));
    this.stepsTargets[index].classList.remove("active");
    this.stepsTargets[(index + 9) % 10].classList.add("active");
    this.quotesTargets[index].classList.add("d-none");
    this.quotesTargets[(index + 9) % 10].classList.remove("d-none");
  }

  next() {
    const index = this.stepsTargets.findIndex(step => step.classList.contains("active"));
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
