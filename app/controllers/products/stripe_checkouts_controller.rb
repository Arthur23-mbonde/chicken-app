module Products
  class StripeCheckoutsController < ApplicationController

    def create
      @product = Product.find(params[:product_id])

      session = Stripe::Checkout::Session.create(
        ui_mode: 'embedded',
        payment_method_types: ['card'],
        line_items: [{
          quantity: 1,
          price_data: {
            currency: 'usd',
            product_data: {
              name: @product.name,
            },
            unit_amount: (@product.current_price * 100).to_i,
          },
        }],
        mode: 'payment',
        return_url: success_product_purchases_url(@product),
      )

      render json: { clientSecret: session.client_secret }
    end

  end
end
