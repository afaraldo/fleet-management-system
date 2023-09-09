import { Controller } from "stimulus";

// Connects to data-controller="login"
export default class extends Controller {
  static targets = ["passwordInput", "passwordIcon"];

  connect() {
    console.log("Login controller connected")
  }

  passwordToggle() {
    const passwordInput = this.passwordInputTarget;
    const passwordIcon = this.passwordIconTarget;

    if (passwordInput.type === 'text') {
      passwordInput.type = 'password'
      passwordIcon.classList.replace("bx-show", "bx-hide")
    } else {
      passwordInput.type = 'text'
      passwordIcon.classList.replace("bx-hide", "bx-show")
    }
  }
}
