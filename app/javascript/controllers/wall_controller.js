import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['crane', 'css', 'html', 'ruby', 'rails', 'js', 'postgre', 'btn', 'reload']

  animate() {
    this.btnTarget.classList.toggle('d-none');
    this.cssTarget.classList.toggle('css');
    this.htmlTarget.classList.toggle('html');
    this.rubyTarget.classList.toggle('ruby');
    this.railsTarget.classList.toggle('rails');
    this.jsTarget.classList.toggle('js');
    this.postgreTarget.classList.toggle('postgre');
    this.craneTarget.classList.toggle('crane-move');
    this.reloadTarget.classList.toggle('d-none');
  }
}
