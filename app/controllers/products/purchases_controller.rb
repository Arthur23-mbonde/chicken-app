module Products
  class PurchasesController < ApplicationController

    before_action :set_product

    def new

    end

    def success

    end

    private

    def set_product
      @product = Product.find(params[:product_id])
    end

  end
end
