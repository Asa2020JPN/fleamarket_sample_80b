class CreditCardsController < ApplicationController

  require "payjp"

  def purchase
    Payjp.api_key = "sk_test_53ccdafb23cf6ca58c7ac797"
    Payjp::Charge.create(
      amount: 809, # 決済する値段
      card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
      currency: 'jpy'
    )
  end

  def new
  end

  def show
  end
end
