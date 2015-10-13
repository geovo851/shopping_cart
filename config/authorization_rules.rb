authorization do
  role :guest do
    has_permission_on :store, :to => [:index]
  end

  role :admin do
    has_permission_on :store, :to => [:index]
    has_permission_on [:products, :categories], :to => :manage

    has_permission_on :admin, :to => :index
  end

  role :user do
    has_permission_on :store, :to => [:index]
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
