import Flatpickr from "stimulus-flatpickr";

// import the translation files and create a translation mapping
import { English } from "flatpickr/dist/l10n/default";
import { Spanish } from "flatpickr/dist/l10n/es";

// creates a new Stimulus controller by extending stimulus-flatpickr wrapper controller
export default class extends Flatpickr {
  locales = {
    en: English,
    es: Spanish
  };

  connect() {
    //define locale and global flatpickr settings for all datepickers
    this.config = {
      locale: 'es',
      altInput: true,
      showMonths: 1,
      enableTime: true,
      time_24hr: true
    };

    super.connect();
  }

  get locale() {
    if (this.locales && this.data.has("locale")) {
      return this.locales[this.data.get("locale")];
    } else {
      return "";
    }
  }
}