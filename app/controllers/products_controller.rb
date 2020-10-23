class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to new_product_path
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :detail, :price, :status_id, :prefecture_id, :shipping_cost_id, :shipping_id, images_attributes: [:image, :_destroy, :id])
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
