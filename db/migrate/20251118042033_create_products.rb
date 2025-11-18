class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :brand
      t.string :product_type
      t.decimal :price, precision: 10, scale: 2
      t.string :price_range
      t.boolean :free_shipping
      t.integer :popularity
      t.integer :rating
      t.json :categories
      t.json :hierarchical_categories
      t.string :object_id

      t.timestamps
    end
  end
end
