class Category < ActiveRecord::Base
  has_many :products
  has_many :discounts_categories

  validates :title, presence: true
end
