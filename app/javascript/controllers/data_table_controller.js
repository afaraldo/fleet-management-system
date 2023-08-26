import { Controller } from "stimulus"
import "datatables.net-bs5";
import 'datatables.net-select';

export default class extends Controller {
  static targets = ["dataTable"];

  connect() {
    this.initDataTable();
  }

  disconnect() {
    this.destroyDataTable();
  }

  initDataTable() {
    this.dataTable = $(".table").DataTable({
      processing: true,
      serverSide: true,
      searching: true,
      paging: true,
      select: true,
      ajax: {
        url: "/users/2/notifications", // Ruta que maneja la obtención de los datos desde el servidor
        type: "GET",
      },
      columns: [
        { data: "message" },
        { data: "status" }
      ],
    });
  }


  destroyDataTable() {
    if (this.dataTable) {
      this.dataTable.destroy();
      this.dataTable = null;
    }
  }
}

