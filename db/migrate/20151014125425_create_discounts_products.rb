class CreateDiscountsProducts < ActiveRecord::Migration
  def change
    create_table :discounts_products do |t|
      t.references :product, index: true, foreign_key: true
      t.integer :quantity
      t.decimal :value, precision: 15, scale: 2, null: false
      t.string :type_discount
      t.boolean :actual, default: true

      t.timestamps null: false
    end
  end
end
