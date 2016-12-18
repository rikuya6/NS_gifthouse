Rails.application.routes.draw do
  root 'top#index'
  get 'about'  => 'top#about', as: 'about'
  resource :sessions, only: [:create, :destroy], as: 'login', path: 'login'
  delete 'logout' => 'sessions#destroy', as: 'logout'

  resources :users do
    resources :orders, only: [:index, :show]
  end
  resources :products
  resource :orders

  namespace :admin do
    root to: 'products#index'
    resources :products do
      member do
        patch 'edit/confirmation' => 'products#edit_confirmation'
      end
      collection do
        post 'new/confirmation'  => 'products#new_confirmation'
      end
    end
    resources :users do
      resources :orders
    end
    resources :orders, only: [:index]
  end

  match '*anything' => 'top#not_found', via: [:get, :post, :patch, :delete]
end
