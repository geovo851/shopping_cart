Rails.application.routes.draw do
  resources :categories
  resources :products
  get 'admin' => 'admin#index', as: 'admin'
  root 'store#index'
end
