Rails.application.routes.draw do
  devise_for :users

  resources :carts
  resources :products_carts

  resources :discounts_products
  resources :discounts_categories

  resources :categories
  resources :products

  get 'store/delivery' => 'store#delivery', as: 'store_delivery'
  get 'store/about' => 'store#about', as: 'store_about'
  get 'store/contact' => 'store#contact', as: 'store_contact'
  post 'store/cart/update_quantity' => 'products_carts#update_quantity', 
        as: 'cart_update_quantity'
  get 'store/cart/:id' => 'store#cart', as: 'store_cart'
  get 'store/search/:id' => 'store#search_products', as: 'store_search_products'
  get 'store/product/:id' => 'store#product', as: 'store_product'
  get 'admin' => 'admin#index', as: 'admin'
  root 'store#index'
end
