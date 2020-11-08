class CardController < ApplicationController

  require "payjp"


  def new
    card = Card.where(user_id: current_user.id)
    binding.pry
    redirect_to action: "show" if card.exists?
  end

def pay
  Payjp.api_key = 'sk_test_53ccdafb23cf6ca58c7ac797'
  if params['payjp-token'].blank?
    redirect_to action: "new"
  else
    
    binding.pry
    
    customer = Payjp::Customer.create(
      description: '登録テスト', #なくてもOK
      email: current_user.email, #なくてもOK
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
    )
    @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
    if @card.save
      redirect_to action: "show"
    else
      redirect_to action: "pay"
    end
  end
end


  def show
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      
      binding.pry
      
      Payjp.api_key = 'sk_test_53ccdafb23cf6ca58c7ac797'
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

end
