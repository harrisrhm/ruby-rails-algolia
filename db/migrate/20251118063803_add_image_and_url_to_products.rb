class AddImageAndUrlToProducts < ActiveRecord::Migration[8.1]
  def change
    add_column :products, :image, :string
    add_column :products, :url, :string
  end
end
