class CardController < ApplicationController
  before_action :authenticate_user!

  require "payjp"

  def new
  end

  def pay

    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)

    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        description: '登録テスト',
        card: params['payjp-token'],
        metadata: {user_id: current_user.id, email: current_user.email}
      )

      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
    end

    if @card.save
      cards = Card.where(user_id: current_user.id)
      @card_selected = PaymentSelected.find_by(user_id: current_user.id)
      @card_selected.update(card_selected: cards.length, card_id: @card.id)
      @card_selected.save
    else
      redirect_to action: "pay"
    end

    if params[:id].blank?
      redirect_to payment_method_mypages_path
    else
      redirect_to payment_method_purchases_path(id: params[:id])
    end
  end

  def delete

    selected = PaymentSelected.find_by(user_id: current_user.id)

    if selected.card_selected > params[:card_value]
      selected.update(card_selected: selected.card_selected.to_i - 1)
    elsif selected.card_selected == params[:card_value]
      selected.update(card_selected: "0", card_id: "")
    end

    # カード削除
    cards = Card.where(user_id: current_user.id)
    card = cards[params[:card_value].to_i - 1]
    card.delete

    # payjp側の削除
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    customer = Payjp::Customer.retrieve(card.customer_id)
    customer.delete

    if selected.card_selected.blank?
      if params[:params_id].blank?
        redirect_to payment_method_mypages_path
      else
        redirect_to payment_method_purchases_path(id: params[:params_id])
      end
    end

    if params[:params_id].blank?
      redirect_to payment_method_mypages_path
    else
      redirect_to payment_method_purchases_path(id: params[:params_id])
    end
  end

end
