Rails.application.routes.draw do
  root 'top#index'
  get 'about'  => 'top#about', as: 'about'
  resource :sessions, only: [:create, :destroy], as: 'login', path: 'login'
  delete 'logout' => 'sessions#destroy', as: 'logout'

  resources :users do
    resources :orders, only: [:index, :show, :destroy]
  end
  resources :products

  resource :orders do
    collection do
      post 'new/confirmation'  => 'orders#new_confirmation'
    end
  end

  resource :boxes do
    collection do
      post 'new/check' => 'boxes#check_product', as: 'check'
      delete 'delete/check' => 'boxes#uncheck_product', as: 'uncheck'
    end
  end

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
