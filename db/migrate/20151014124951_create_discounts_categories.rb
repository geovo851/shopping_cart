class CreateDiscountsCategories < ActiveRecord::Migration
  def change
    create_table :discounts_categories do |t|
      t.references :category, index: true, foreign_key: true
      t.integer :quantity
      t.decimal :value, precision: 15, scale: 2, null: false
      t.string :type_discount
      t.boolean :actual, default: true

      t.timestamps null: false
    end
  end
end
