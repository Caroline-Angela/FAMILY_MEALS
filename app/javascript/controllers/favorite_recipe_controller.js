import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorite-recipe"
export default class extends Controller {
  static targets = "img"
  static values = {
    active: String,
    inactive: String

  }
  connect(){
    console.log("test")
  }
  toggle(event) {
    if (event.currentTarget.innerHTML.includes('fa-regular')) {
      event.currentTarget.innerHTML =` <i class="fa-solid fa-bookmark"></i>`
     } else  {
       event.currentTarget.innerHTML =` <i class="fa-regular fa-bookmark"></i>`
     }
  }

}

// add a new route + action in the recipes controller -> to bookmark
// fetch call the new action
