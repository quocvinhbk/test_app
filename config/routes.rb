Rails.application.routes.draw do
  root to: 'categories#index'

  resources :products do
    member do
      patch :publish
    end
  end
  resources :categories


  scope '/admin' do
    devise_for :admin, skip: [:sessions]
    as :admin do
      get '/login', to: 'admin/sessions#new', as: :new_admin_session
      post '/login', to: 'admin/sessions#create', as: :admin_session
      match '/logout', to: 'admin/sessions#destroy', as: :destroy_admin_session, via: Devise.mappings[:admin].sign_out_via
    end
  end
  
  namespace :admin do
    root to: 'companies#index'
    resources :companies
    resources :jobs
  end



  devise_for :manage, skip: [:sessions]
  as :manage do
    get '/manage/login', to: 'manage/sessions#new', as: :new_manage_session
    post '/manage/login', to: 'manage/sessions#create', as: :manage_session
    match '/manage/logout', to: 'manage/sessions#destroy', as: :destroy_manage_session, via: Devise.mappings[:manage].sign_out_via
  end

  namespace :manage do
    root to: 'jobs#index'
    resources :jobs
  end
end
