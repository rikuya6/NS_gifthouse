Rails.application.routes.draw do
  root 'top#index'
  get 'about' => 'top#about', as: 'about'
  get 'login' => 'sessions#new', as: 'login'
  resource :session, only: [:create, :destroy], as: 'login', path: 'login'
  resources :users


  namespace :admin do
    root to: 'products#index'
    resources :products
  end

  match '*anything' => 'top#not_found', via: [:get, :post, :patch, :delete]
end
