import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect(){
    var elems = document.querySelectorAll('.modal');
    var instances = M.Modal.init(elems, {});
    this.modal = instances[0]
    this.modal.open()
  }

  submitEnd(event){
    if(event.detail.success)
      this.modal.destroy()
  }
}

