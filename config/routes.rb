Rails.application.routes.draw do
  resources :posts
  resources :products
  resources :categories
  # root to: 'categories#index'
  root to: 'posts#index'

  devise_for :admin, skip: [:sessions]
  as :admin do
    get '/admin/login', to: 'admin/sessions#new', as: :new_admin_session
    post '/admin/login', to: 'admin/sessions#create', as: :admin_session
    match '/admin/logout', to: 'admin/sessions#destroy', as: :destroy_admin_session, via: Devise.mappings[:admin].sign_out_via
  end
end
