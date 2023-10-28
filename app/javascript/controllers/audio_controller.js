import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['music', 'on', 'off']

  on() {
    console.log('sound on !')
    this.musicTarget.play()
  }

  off() {
    console.log('sound off !')
    this.musicTarget.pause()
  }
}
