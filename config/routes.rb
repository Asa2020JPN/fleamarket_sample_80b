Rails.application.routes.draw do
  root 'items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :purchases, only: [:index, :new]
  get 'purchases/edit', to: 'purchases#edit'
end
