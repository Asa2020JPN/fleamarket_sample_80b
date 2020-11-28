class MypagesController < ApplicationController

  def index
    @saler = Product.where(saler_id: current_user.id)
    @buyer = Product.where(buyer_id: current_user.id)
  end
end