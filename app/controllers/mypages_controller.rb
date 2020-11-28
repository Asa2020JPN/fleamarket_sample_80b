class MypagesController < ApplicationController

  def index
    @saler = Product.where(saler_id: current_user.id)
    @buyer = Product.where(buyer_id: current_user.id)
    # @selected_product= user.products
    # @selected_product = Product.includes(:images).where(buyer_id: nil).order('created_at DESC').limit(5)
    
  end

  def new
  
  end

end