Rails.application.routes.draw do

  resources :mypages, only: [:index, :show, :destroy] do
    collection do
      get 'payment_method'
      get 'payment_method/card', to: 'mypages#card_new'
    end
  end

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
      get  'payment_method'
      get  'address'
      get  ':id', to: 'purchases#index'
      post 'pay', to: 'purchases#pay'
      post 'pay/:id', to: 'purchases#pay'
      post 'paymethod_selected'
      get  'payment_method/:id', to: 'purchases#payment_method'
    end
  end

  resources :tops, only: :show
  resources :products, only: [:index]
  resources :registrations, only: [:index]
  root 'products#index'

  resources :products, except: :destroy do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :card, only: :new do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'pay/:id', to: 'card#pay'
      post 'delete', to: 'card#delete'
      get 'card/new/:id', to: 'card#new'
    end
  end

end
