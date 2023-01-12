class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.string :product_type
      t.string :discount
      t.string :units
      t.string :category
      t.string :image

      t.timestamps
    end
  end
end
