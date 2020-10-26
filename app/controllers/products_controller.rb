class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create, :get_category_children, :get_category_grandchildren]

  def new
    @product = Product.new
    @product.images.new
    @product.build_brand
    #セレクトボックスの初期値設定
    @category_parent_array = [""]
    # categoriesから親カテゴリーの名前のみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    # @category_parent_array = Category.where(ancestry: nil)
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render new_product_path
    end
  end


  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      redirect_to new_product_path
    end
  end

  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    # binding.pry
    @category_children = Category.find("#{params[:parent_id]}").children
    # @category_children = Category.find_by(name: "#{params[:parent_id]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private

  def product_params
    params.require(:product).permit(:name, :detail, :price, :status_id, :prefecture_id, :category_id, :shippingcost_id, :shipping_id, brand_attributes: [:id, :name], images_attributes: [:image, :_destroy, :id])
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
