Rails.application.routes.draw do
  root 'items#index'
  resources :tops, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
