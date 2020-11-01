Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'identifications', to: 'users/registrations#new_identification'
    post 'identifications', to: 'users/registrations#create_identification'

    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'items#index'
  resources :purchases, only: [:index, :new]
  get 'purchases/edit', to: 'purchases#edit'
  resources :tops, only: :show
  resources :products, only: [:index]
  resources :registrations, only: [:index]
=======
  root 'products#index'
  get 'purchases/edit', to: 'purchases#edit'
  resources :purchases, only: [:index, :new]
  # resources :tops, only: [:index, :show]
  # resources :products, only: [:index]
  resources :products, only: [:index, :show, :new, :create, :edit, :create] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
>>>>>>> master
end

