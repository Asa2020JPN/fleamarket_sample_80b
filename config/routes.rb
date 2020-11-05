Rails.application.routes.draw do
  root 'items#index'
  # root'users#logout'
  # root 'posts#index'
  get 'mypages', to:'mypages#index'
  get 'users', to: 'users#logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
#