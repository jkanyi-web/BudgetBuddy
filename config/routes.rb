Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :transactions
  resources :categories do
    resources :transactions
  end
  resources :entities
  resources :groups
  resources :users
  get "up" => "rails/health#show", as: :rails_health_check

  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end

  root 'splash#index'
end
