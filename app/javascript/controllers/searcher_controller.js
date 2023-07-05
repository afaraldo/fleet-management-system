import { Controller } from "stimulus";
import Rails from "@rails/ujs";

export default class extends Controller {
    static targets = ["input", "results"];

    static URL = "/searcher/search";

    connect() {
        console.log("Search controller connected");
    }

    search() {
        const query = this.inputTarget.value;

        Rails.ajax({
            type: "get",
            url: "/searcher/search",
            data: `q=${query}`,
            success: (data) => {
                console.log("Request successful");
                this.displayResults(data);
            },
            error: (error) => {
                console.error("Request failed");
            },
        });
    }

    displayResults(results) {
        const resultsContainer = this.resultsTarget;
        resultsContainer.innerHTML = ""; // Limpiar los resultados anteriores

        results.forEach((result) => {
            const listItem = document.createElement("li");
            listItem.textContent = result; // Ajusta esta línea para mostrar los datos relevantes de cada resultado
            resultsContainer.appendChild(listItem);
        });
    }
}
