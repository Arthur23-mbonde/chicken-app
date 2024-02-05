class CartController < ApplicationController

  def show
    @render_cart = false
  end

  def add
    @product = Product.find_by(id: params[:id])
    rate = params[:rate].to_i
    current_cart_product = @cart.cart_products.find_by(product_id: @product.id)
    if current_cart_product && rate > 0
      current_cart_product.update(rate:)
    elsif rate <= 0
      current_cart_product.destroy
    else
      @cart.cart_products.create(product: @product, rate:)
    end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [turbo_stream.replace('cart',
                                                    partial: 'cart/cart',
                                                    locals: { cart: @cart }),
                              turbo_stream.replace(@product)]
      end
    end

  end

  def remove
    CartProduct.find_by(id: params[:id]).destroy

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('cart',
                                                  partial: 'cart/cart',
                                                  locals: { cart: @cart})
      end
    end

  end

end
