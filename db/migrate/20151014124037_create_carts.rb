class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.decimal :discount, precision: 15, scale: 2, default: 0
      t.decimal :total_sum, precision: 15, scale: 2, default: 0

      t.timestamps null: false
    end
  end
end
