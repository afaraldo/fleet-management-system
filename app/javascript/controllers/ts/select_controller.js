import { Controller } from "@hotwired/stimulus"
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
      render:{
        option_create: function( data, escape ){
          return '<div class="create">Crear <strong>' + escape(data.input) + '</strong>&hellip;</div>';
        },
        option: function(data, escape) {
          return '<div>' +
              '<span class="title">' + escape(data.text) + '</span>' +
              '<span class="url">' + escape(data.id) + '</span>' +
              '</div>'
        },
        no_results: function( data, escape ){
          return '<div class="no-results">No existen resultados</div>';
        },
      },
      load: (q, callback) => this.search(q, callback)
    };

    new TomSelect(this.element, config)
  }

  async search(q, callback) {
    const response = await get(this.urlValue, {
      query: {
        q: JSON.stringify({ make_start_or_number_plate_start: q })
      },
      responseKind: 'json'
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
