authorization do
  role :guest do
    has_permission_on :store, :to => [:index, :product, :cart, :search_products, :delivery, :about, :contact]
    has_permission_on [:products_carts], :to => :manage
    has_permission_on :products_carts, :to => [:update_quantity, :create, :destroy]
  end

  role :admin do
    has_permission_on :store, :to => [:index, :product, :cart, :search_products, :delivery, :about, :contact]
    has_permission_on [:products, :categories, :discounts_categories, :discounts_products], :to => :manage
    has_permission_on :admin, :to => :index
    has_permission_on :products_carts, :to => [:update_quantity, :create, :destroy]
  end

  role :user do
    has_permission_on :store, :to => [:index, :product, :cart, :search_products, :delivery, :about, :contact]
    has_permission_on :products_carts, :to => [:update_quantity, :create, :destroy]
  end
end

privileges do
  # default privilege hierarchies to facilitate RESTful Rails apps
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end
