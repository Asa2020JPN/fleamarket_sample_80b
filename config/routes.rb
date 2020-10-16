Rails.application.routes.draw do
  root 'items#index'
  resources :tops, only: :show
  resources :products, only: [:index]
end
