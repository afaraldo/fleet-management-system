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

  initialize() {
    // sets your language (you can also set some global setting for all time pickers)
    this.config = {
      locale: 'es',
      showMonths: 1,
      enable_time: true,
      dateFormat: "d/m/Y H:i"
    };
  }

  connect() {
    //define locale and global flatpickr settings for all datepickers
    this.config = {
      ...this.config, //spread options in case some where defined in initialize
      locale: 'es',
      showMonths: 1,
      enable_time: true,
      dateFormat: "d/m/Y H:i"
    };
    super.connect(); // always call super.connect();
    this.element.setAttribute('autocomplete','off')
    this.element.removeAttribute('readonly')
  }

  get locale() {
    if (this.locales && this.data.has("locale")) {
      return this.locales[this.data.get("locale")];
    } else {
      return "";
    }
  }
}