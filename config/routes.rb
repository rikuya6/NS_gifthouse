Rails.application.routes.draw do
  root 'top#index'
  get 'about' => 'top#about', as: 'about'
  get 'login' => 'sessions#new', as: 'login'
  resource :session, only: [:create, :destroy], as: 'login', path: 'login'
  resources :users
end
