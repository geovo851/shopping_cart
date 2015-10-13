Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :products
  get 'admin' => 'admin#index', as: 'admin'
  root 'store#index'
end
