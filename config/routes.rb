Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
    devise_scope :user do
    get 'identifications', to: 'users/registrations#new__identification'
    post 'identifications', to: 'users/registrations#create__identification'
  end
  root 'items#index'
  resources :purchases, only: [:index, :new]
  get 'purchases/edit', to: 'purchases#edit'
  resources :tops, only: :show
  resources :products, only: [:index]
  resources :registrations, only: [:index]
end
