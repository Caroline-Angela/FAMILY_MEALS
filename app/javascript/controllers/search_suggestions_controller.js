import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = [ "hiddenField" ]

  toggleHiddenField(event) {
    this.hiddenFieldTargets.forEach((t) => {
      if (event.currentTarget.innerText === "My Recipes") {
        t.value = "myfavorites"
      } else {
        t.value = "suggestions"
      }
    })
  }
}
