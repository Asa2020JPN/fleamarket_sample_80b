class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show ]
  before_action :set_product, except: [:index, :show, :new, :create, :get_category_children, :get_category_grandchildren]
  def index
    @new_products = Product.includes(:images).order('created_at DESC').limit(5)
  end
  
  def show
    @selected_product = Product.includes(:images).find(params[:id])
    @categories = Category.all
  end

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
    @product = Product.find(params[:id])
    @category_parent_array = Category.roots
    @product_root_category = @product.category.root
    @product_children_category = @product_root_category.children
    product_parent_category = @product.category.parent
    @product_grandcildren_category = product_parent_category.children      
  end
  
  def update
    if @product.update(product_params)
      redirect_to root_path
    else
    @category_parent_array = Category.roots
    @product_root_category = Product.find(params[:id]).category.root
    @product_children_category = @product_root_category.children
    product_parent_category = Product.find(params[:id]).category.parent
    @product_grandcildren_category = product_parent_category.children
    render :edit
    end
  end

  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    Category.find("#{params[:parent_id]}").children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    Category.find("#{params[:child_id]}").children
  end

  private

  def product_params
    params.require(:product).permit(:name, :detail, :price, :status_id, :prefecture_id, :category_id, :shippingcost_id, :shipping_id, brand_attributes: [:id, :name], images_attributes: [:image, :_destroy, :id]).merge(saler_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
