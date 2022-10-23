import { Controller } from "@hotwired/stimulus"
import TomSelect      from "tom-select"

// DOCS!! https://coolrequest.dev/2021/11/25/replace_select2.html
// Connects to data-controller="ts--select"
export default class extends Controller {
  connect() {
    new TomSelect(this.element)
  }
}
