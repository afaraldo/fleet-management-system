import { Controller } from "stimulus"
import { get }        from '@rails/request.js'
import TomSelect      from "tom-select"

// DOCS!! https://coolrequest.dev/2021/11/25/replace_select2.html
// Connects to data-controller="ts--select"
export default class extends Controller {
  static values = { url: String }

  connect() {
    const config = {
      plugins: ['clear_button'],
      valueField: 'value',

      load: (q, callback) => this.search(q, callback)
    };

    new TomSelect(this.element, config)
  }

  async search(query, callback) {
    const response = await get(this.urlValue, {
      query: {'q[plate_number_cont]': query},
      responseKind: 'json',
      contentType: "application/json",
    })

    if (response.ok) {
      const list = await response.json
      const result = list.map((item) => { return {text: item.text, value: item.id} })
      callback(result)
    } else {
      console.log(response)
      callback()
    }
  }
}
