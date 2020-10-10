Rails.application.routes.draw do
  get 'tops/show'
  root 'items#index'
  resources :tops, only: :show
end
