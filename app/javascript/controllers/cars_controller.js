import { Controller } from "@hotwired/stimulus"
import Polipop from 'polipop';

// Connects to data-controller="cars"
export default class extends Controller {
  static targets = [ "name" ]
  connect() {
    var polipop1 = new Polipop('lollipop', {
      layout: 'popups',
      insert: 'before',
      pool: 5,
      sticky: true,
      theme: 'default',
      closer: false,
      position: 'top-right'
    });

    polipop1.add({
      content: 'OK',
      title: 'Message',
      type: 'success'
    });
  }

  greet() {
    const element = this.nameTarget
    const name = element.value
    console.log(`hello, ${name}!`)
  }
}
