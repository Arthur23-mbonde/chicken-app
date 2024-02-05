class CartProduct < ApplicationRecord

  belongs_to :product
  belongs_to :cart

  def total
    product.current_price * rate
  end

end
