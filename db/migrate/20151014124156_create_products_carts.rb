class CreateProductsCarts < ActiveRecord::Migration
  def change
    create_table :products_carts do |t|
      t.references :cart, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.integer :quantity, precision: 15, scale: 2, null: false
      t.decimal :price, precision: 15, scale: 2, null: false

      t.timestamps null: false
    end
  end
end
