import { Controller } from "@hotwired/stimulus"
import { post } from "@rails/request.js"

// Connects to data-controller="stripe-checkout"
export default class extends Controller {
  static values = { publishablekey: String, url: String };
  async connect() {
    const stripe = Stripe(this.publishablekeyValue);
    
    const response = await post(this.urlValue);

    const { clientSecret } = await Response.json;

    const checkout = await stripe.initEmbeddedCheckout({
      clientSecret,
    });

    // Mount Checkout
    checkout.mount(this.element);

  };
}
