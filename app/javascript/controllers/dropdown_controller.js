import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['button', 'item', 'navigation']

  reveal() {
    this.buttonTargets.forEach(element => {
      element.classList.toggle('d-none');
    });
    this.itemTargets.forEach(element => {
      element.classList.remove('close-animation');
      element.classList.add('open-animation');
    });
    this.navigationTarget.classList.remove('d-none');
  }

  hide() {
    this.buttonTargets.forEach(element => {
      element.classList.toggle('d-none');
    });
    this.itemTargets.forEach(element => {
      element.classList.remove('open-animation');
      element.classList.add('close-animation');
    });
  }

  animationend() {
    if(this.itemTargets[0].classList.value.includes('close')) {
      this.navigationTarget.classList.add('d-none');
    }
  }

  french() {
    const url = window.location.href;
    let arr = url.split('/')
    if (arr.indexOf('en') > -1) {
      arr.splice(index, 1);
    }
    else if (arr.indexOf('fr') > -1) {
      arr.splice(index, 1);
    }
    arr.splice(arr.indexOf(window.location.hostname), 0, 'fr');
    const newUrl = arr.join('/');
    window.location.href = newUrl;
  }

  english() {
    const url = window.location.href;
    let arr = url.split('/')
    const index = arr.indexOf('fr');
    if (index > -1) {
      arr.splice(index, 1);
    }
    const newUrl = arr.join('/');
    window.location.href = newUrl;
  }
}
