import { Application } from "stimulus"
const application = Application.start()

// Configure Stimulus development experience
application.debug = false

window.Stimulus = Application.start()

export { application }


