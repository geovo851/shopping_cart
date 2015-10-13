class Product < ActiveRecord::Base
  belongs_to :category

  validates :name, :category_id, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
