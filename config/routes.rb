Rails.application.routes.draw do

  get 'card/new'

  resources :mypages, only: [:index, :show, :destroy]
  get 'users', to: 'users#logout'

  resources :categories, only: [:show]
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'identifications', to: 'users/registrations#new_identification'
    post 'identifications', to: 'users/registrations#create_identification'

    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  resources :purchases, only: [:index, :create] do
    collection do
      get 'payment_method'
      get 'address'
    end
  end

  get 'purchases/:id', to: 'purchases#index'

  post 'purchases/pay', to: 'purchases#pay'
  post 'purchases/pay/:id', to: 'purchases#pay'

  post 'purchases/paymethod_selected'
  get 'purchases/payment_method/:id', to: 'purchases#payment_method'

  resources :tops, only: :show
  resources :products, only: [:index]
  resources :registrations, only: [:index]
  root 'products#index'

  resources :products, only: [:index, :show, :new, :create, :edit, :create] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  post 'pay/:id', to: 'card#pay'

  get 'card/new/:id', to: 'card#new'

end
