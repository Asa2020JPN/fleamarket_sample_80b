class PurchasesController < ApplicationController

  require 'payjp'

  def index
    @product = Product.includes(:images).find(params[:id])
    @address = Address.find(current_user.id)
    # card = Card.where(user_id: current_user.id).first
    @card_selected = PaymentSelected.find_by(user_id: current_user.id)

    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)

    if @card_selected.card_selected.to_i != 0
      @card_selected.card.customer_id
      card = Payjp::Customer.retrieve(@card_selected.card.customer_id)
      @card_info = card.cards.data[0]
    end
  end

  def pay
    @product = Product.find(params[:id])
    @card_selected = PaymentSelected.find_by(user_id: current_user.id)

    if @card_selected.card.blank?
      flash[:notice] = 'クレジットカードで購入してください。'
      redirect_to controller: :purchases, action: :index, id: @product.id
    else

      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)

      Payjp::Charge.create(
        amount: @product.price,
        customer: @card_selected.card.customer_id,
        currency: 'jpy',
      )

      @product.buyer_id = current_user.id
      @product.save

      redirect_to root_path
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

  def paymethod_selected
    @card_selected = PaymentSelected.find_by(user_id: current_user.id)
    @card_selected.update(selected_params)

    if @card_selected.card_selected == "0"
      @card_selected.card_id = ""
      @card_selected.save
    else
      cards = Card.where(user_id: current_user.id)
      @card_selected.card_id = cards[@card_selected.card_selected.to_i - 1].id
      @card_selected.save
    end

    if @card_selected.id_path.blank?
      redirect_to payment_method_purchases_path
    else
      redirect_to purchases_path(id: @card_selected.id_path)
    end
  end

  private

  def selected_params
    params.require(:payment_selected).permit(:card_selected, :id_path)
  end
end
