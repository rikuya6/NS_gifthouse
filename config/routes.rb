Rails.application.routes.draw do
  root 'top#index'
  get 'about'  => 'top#about', as: 'about'

  get 'login' => 'sessions#new', as: 'login'
  resource :sessions, only: [:create, :destroy], as: 'login', path: 'login'
  delete 'logout' => 'sessions#destroy', as: 'logout'

  resources :users
  resources :products

  namespace :admin do
    root to: 'products#index'
    resources :products
    resources :users
    resources :orders
  end

  match '*anything' => 'top#not_found', via: [:get, :post, :patch, :delete]
end
