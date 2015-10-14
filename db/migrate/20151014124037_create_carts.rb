class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.decimal :discount, precision: 15, scale: 2
      t.decimal :total_sum, precision: 15, scale: 2, null: false

      t.timestamps null: false
    end
  end
end
