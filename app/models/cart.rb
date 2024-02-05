class Cart < ApplicationRecord

  has_many :cart_products
  has_many :products, through: :cart_products

  def total
    cart_products.to_a.sum { |cart_product| cart_product.total }
  end

end
