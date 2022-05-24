import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    messages: String
  }
  
  connect(){
    let messages = this.parseMessages()
    for(let index in messages) 
      M.toast({ html: messages[index] })
  }
  
  parseMessages(){
    return JSON.parse(this.messagesValue)
  }
}
