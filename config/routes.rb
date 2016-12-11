Rails.application.routes.draw do
  root 'top#index'
  get 'about'  => 'top#about', as: 'about'
  resource :sessions, only: [:create, :destroy], as: 'login', path: 'login'
  delete 'logout' => 'sessions#destroy', as: 'logout'

  resources :users
  resources :products

  namespace :admin do
    root to: 'products#index'
    resources :products
    resources :users do
      resources :orders
    end
    resources :orders, only: [:index]
  end

  match '*anything' => 'top#not_found', via: [:get, :post, :patch, :delete]
end
