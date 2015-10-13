Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :products
  get 'store/show/:id' => 'store#show', as: 'store_show_product'
  get 'admin' => 'admin#index', as: 'admin'
  root 'store#index'
end
