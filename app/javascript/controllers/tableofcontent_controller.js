import { Controller } from "@hotwired/stimulus"

const activeClosestItem = (sections, items) => {
  const sectionsDistance = []
  sections.forEach(section => {
    const position = section.getBoundingClientRect();
    sectionsDistance.push(Math.abs(position.top));
  });
  const index = sectionsDistance.indexOf(Math.min(...sectionsDistance));
  items.forEach(item => {
    item.classList.remove('active');
  })
  items[index].classList.add('active')
}

export default class extends Controller {
  static targets = ['items', 'sections']

  connect() {
    activeClosestItem(this.sectionsTargets, this.itemsTargets)
  }

  followscroll() {
    activeClosestItem(this.sectionsTargets, this.itemsTargets)
  }
}
