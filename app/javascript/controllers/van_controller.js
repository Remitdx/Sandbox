import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['van', 'l2', 'l3', 'l45', 'night', 'play', 'pause', 'reload']

  play() {
    this.playTarget.classList.toggle('d-none');
    this.pauseTarget.classList.toggle('d-none');
    this.vanTarget.classList.add('van-animate');
    this.l2Target.classList.add('layer-2-animate');
    this.l3Target.classList.add('layer-3-animate');
    this.l45Targets.forEach(element => {
      element.classList.add('layer-4-5-animate');
    });
    this.vanTarget.classList.remove('paused');
    this.l2Target.classList.remove('paused');
    this.l3Target.classList.remove('paused');
    this.l45Targets.forEach(element => {
      element.classList.remove('paused');
    });
  }

  pause() {
    this.playTarget.classList.toggle('d-none');
    this.pauseTarget.classList.toggle('d-none');
    this.vanTarget.classList.add('paused');
    this.l2Target.classList.add('paused');
    this.l3Target.classList.add('paused');
    this.l45Targets.forEach(element => {
      element.classList.add('paused');
    });
  }

  dropNight() {
    this.nightTarget.classList.remove('d-none');
    this.nightTarget.classList.add('drop-night');
  }

  reload() {
    this.reloadTarget.classList.remove('d-none')
    this.reloadTarget.classList.add('night-reload-btn')
  }

  restart() {
    this.playTarget.classList.remove('d-none');
    this.pauseTarget.classList.add('d-none');
    this.vanTarget.classList.remove('van-animate');
    this.l2Target.classList.remove('layer-2-animate');
    this.l3Target.classList.remove('layer-3-animate');
    this.l45Targets.forEach(element => {
      element.classList.remove('layer-4-5-animate');
    });
    this.nightTarget.classList.remove('drop-night');
    this.nightTarget.classList.add('d-none');
    this.reloadTarget.classList.add('d-none')
    this.reloadTarget.classList.remove('night-reload-btn')

  }
}
