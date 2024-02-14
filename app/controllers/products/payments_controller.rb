module Products
  class PaymentsController < ApplicationController

    before_action :set_product

    def new

    end

    def create
      customer = Stripe::Customer.create(
        name: current_user.first_name,
        email: current_user.email,
      )

      session = Stripe::Checkout::Session.create(
        customer: customer,
        payment_method_types: ['card'],
        line_items: [{
          quantity: 1,
          price_data: {
            currency: 'usd',
            product_data: {
              name: @product.name,
            },
            unit_amount: (@product.current_price * 100).to_i,
          }
        }],
        mode: 'payment',
        success_url: root_url,
        cancel_url: root_url
      )

      redirect_to root_url
    end

    def success
      redirect_to root_url, notice: "Purchase Successful"
    end

    def cancel
      redirect_to root_url, notice: "Purchase Unsuccessful"
    end

    private

    def set_product
      @product = Product.find(params[:product_id])
    end

  end

end
