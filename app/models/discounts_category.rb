class DiscountsCategory < ActiveRecord::Base
  belongs_to :category

  validates :type_discount, :category_id, presence: true
  validates :quantity, :value, presence: true, numericality: { greater_than: 0 }

  def self.types
    ['Percentage of total', 'Fixed sum']
  end
end
