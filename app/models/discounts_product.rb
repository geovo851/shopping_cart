class DiscountsProduct < ActiveRecord::Base
  belongs_to :product

  validates :type_discount, :product_id, presence: true
  validates :quantity, :value, presence: true, numericality: { greater_than: 0 }

  def self.types
    ['Percentage of total', 'Fixed sum']
  end
end
