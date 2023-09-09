import { Controller } from "stimulus";

export default class extends Controller {
    static targets = ["query", "results"];

    connect() {
        console.log("Search controller connected")
        this.queryTarget.addEventListener("keyup", () => this.search());
    }

    search() {
        if (this.queryTarget.value.length > 1) {
            fetch(`/search?query=${this.queryTarget.value}`)
                .then(response => response.json())
                .then(data => {
                    if (data.length === 0) {
                        this.resultsTarget.innerHTML = `
            <div class="list-group position-absolute bg-white" style="max-width: 300px; width: 100%;">
              <div class="list-group-item">
                <div class="text-muted">No se encontraron resultados</div>
              </div>
            </div>
          `;
                    } else {
                        this.resultsTarget.innerHTML = data.map(result => `
            <a href="${result.url}" class="list-group-item list-group-item-action">
              <div class="d-flex align-items-stretch">
                <div style="flex: 0 0 48px; height: 100%; border: 1px solid #ccc; border-radius: 4px; overflow: hidden;">
                  <img src="${result.icon}" alt="${result.model_name} icon" style="width: 100%; height: 100%; object-fit: cover;"/>
                </div>
                <div class="ms-2 d-flex flex-column justify-content-center" style="flex-grow: 1;">
                  <strong>${result.model_name}</strong>: ${result.title}
                  <div>${result.description || 'No description available'}</div>
                </div>
              </div>
            </a>
          `).join('');
                    }
                });
        } else {
            this.resultsTarget.innerHTML = `
      <div class="list-group position-absolute bg-white" style="max-width: 300px; width: 100%;">
        <div class="list-group-item">
          <div class="text-muted">Ingrese más caracteres para buscar</div>
        </div>
      </div>
    `;
        }
    }

}