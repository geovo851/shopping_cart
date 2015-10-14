class Product < ActiveRecord::Base
  belongs_to :category
  has_many :products_carts
  has_many :carts, through: :products_carts
  has_many :discounts_products

  validates :name, :category_id, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
