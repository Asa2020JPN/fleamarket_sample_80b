Rails.application.routes.draw do
  root 'items#index'
   resources :products, only: [:new, :create, :edit, :create]
end