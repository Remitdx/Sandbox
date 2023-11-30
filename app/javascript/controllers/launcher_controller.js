import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['options', 'players', 'map', 'launch']

  // TODO: Launcher implementation

  connect() {
   console.log(this.playersTarget)
  }
}
