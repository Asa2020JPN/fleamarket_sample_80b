Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :purchases, only: [:index, :new]
  get 'purchases/edit', to: 'purchases#edit'
  resources :tops, only: :show
  resources :products, only: [:index]
  resources :registrations, only: [:index]
end
