class CreditsController < ApplicationController

  require 'payjp'

  def create
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    if params ['payjp-token'].blank?
      render :new
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      @credit_card = Credit_card.new(user_id: current_user, customer_id: customer.id, card_id: customer.default_card)
      if @credit_card.save
        redirect_to user_path(current_user.id)
      else
        render :new
      end
  end
  
end
