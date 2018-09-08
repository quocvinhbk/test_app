Rails.application.routes.draw do
  resources :products
  resources :categories
  root to: 'categories#index'
end
