class MypagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @saler_products = Product.where(saler_id: current_user.id)
    @buyer_products = Product.where(buyer_id: current_user.id)
    @user = User.find_by(id: current_user.id)
  end

  def show
    if user_signed_in?
      @selected_product = Product.includes(:images).find(params[:id])
      @categories = Category.all
    else
      redirect_to new_user_session_path
    end
  end

  def payment_method
    @card_selected = PaymentSelected.find_by(user_id: current_user.id)
    cards = Card.where(user_id: current_user.id)

    @cards_info = []

    cards.each do |card|
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      payjp_card = Payjp::Customer.retrieve(card.customer_id)
      @cards_info << payjp_card.cards.retrieve(card.card_id)
    end

    @payment_selected = PaymentSelected.new
  end

  def destroy
    delete_product = Product.find(params[:id])
    delete_product.destroy
    redirect_to mypages_path
  end
end