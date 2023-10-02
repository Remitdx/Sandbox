import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['crane', 'css', 'html', 'ruby', 'rails', 'js', 'postgre']

  animate() {
    this.cssTarget.classList.add('css');
    this.htmlTarget.classList.add('html');
    this.rubyTarget.classList.add('ruby');
    this.railsTarget.classList.add('rails');
    this.jsTarget.classList.add('js');
    this.postgreTarget.classList.add('postgre');
    this.craneTarget.classList.add('crane-move');
  }
}
