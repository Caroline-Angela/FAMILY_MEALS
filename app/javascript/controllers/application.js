import { Application } from "@hotwired/stimulus"
import flatpickr from "flatpickr";



const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "startTime", "endTime" ]
  connect() {
    flatpickr(this.startTimeTarget, {
              enableTime: true,
              // Provide an id for the plugin to work
              plugins: [new rangePlugin({ input: "#end_time"})]})
    flatpickr(this.endTimeTarget, {})
  }
}
