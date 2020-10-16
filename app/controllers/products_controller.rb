class ProductsController < ApplicationController
  def new
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to new_product_path

  end

  def product_params
    params.require(:product).permit(:name, :detail, :price, images_attributes: [:image])
  end
end
