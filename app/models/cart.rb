class Cart < ActiveRecord::Base
  has_many :products_carts, dependent: :destroy
  has_many :products, through: :products_carts
end
