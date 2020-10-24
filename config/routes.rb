Rails.application.routes.draw do
  root 'items#index'

   resources :products, only: [:new, :create, :edit, :create] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
end