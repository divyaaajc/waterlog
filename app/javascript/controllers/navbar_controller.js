import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'reviewTitle' ];

  connect() {
    console.log(this.loggedValue, typeof(this.loggedValue));
  }
  
  showNav(event) {
    const text = this.reviewTitleTarget.innerHTML;
    this.reviewTitleTarget.innerHTML = this.reviewTitleTarget.dataset.text;
    this.reviewTitleTarget.setAttribute("data-text", text)
  }
}