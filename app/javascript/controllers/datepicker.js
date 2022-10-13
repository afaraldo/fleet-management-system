import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "input", "toggle" ]

    connect() {
        //global options
        this.config = {
            ...this.config, //spread options in case some where defined in initialize
            enableTime: true,
            time_24hr: true
        };

        //always call super.connect()
        super.connect();
    }

    datepicker
}