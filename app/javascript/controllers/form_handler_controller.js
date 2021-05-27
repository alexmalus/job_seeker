import { Controller } from 'stimulus';

// Synergy with AlertController. This controller displays the flash.
export default class extends Controller {
  static targets = ['input', 'flash'];

  displayFlash(event) {
    const [data, status, xhr] = event.detail;
    this.flashTarget.innerHTML += xhr.response;
  }
}
