class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.references :category, index: true, foreign_key: true
      t.decimal :price, precision: 15, scale: 2, null: false
      t.text :photo

      t.timestamps null: false
    end
  end
end
