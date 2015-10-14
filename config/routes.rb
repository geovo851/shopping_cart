Rails.application.routes.draw do
  devise_for :users

  resources :carts
  resources :products_carts

  resources :discounts_products
  resources :discounts_categories

  resources :categories
  resources :products
  get 'store/search/:id' => 'store#search_products', as: 'store_search_products'
  get 'store/show/:id' => 'store#show', as: 'store_show_product'
  get 'admin' => 'admin#index', as: 'admin'
  root 'store#index'
end
