class ProductsController < ApplicationController

  def new
    @product = Product.new.order('created_at DESC')
  end
end
