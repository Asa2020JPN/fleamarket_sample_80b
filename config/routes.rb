Rails.application.routes.draw do

  root 'tops#index'
  resources :purchases, only: [:index, :new]
  get 'purchases/edit', to: 'purchases#edit'
  resources :tops, only: [:index, :show]
  resources :products, only: [:index]

end
