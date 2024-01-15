// app/javascript/controllers/work_order_date_controller.js

import { Controller } from "stimulus";

export default class extends Controller {
    static targets = ["start", "end"];

    connect() {
        console.log("WorkOrderDate controller connected");
    }

    updateEndDate() {
        const startDate = this.startTarget.value;
        if (startDate) {
            const endDateTime = new Date(startDate);
            endDateTime.setHours(23, 55);  // Establece la hora a 12:00

            const year = endDateTime.getFullYear();
            const month = (endDateTime.getMonth() + 1).toString().padStart(2, '0');
            const day = endDateTime.getDate().toString().padStart(2, '0');
            const hour = endDateTime.getHours().toString().padStart(2, '0');
            const minute = endDateTime.getMinutes().toString().padStart(2, '0');

            this.endTarget.value = `${year}-${month}-${day} ${hour}:${minute}`;
        }
    }
}