# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb
require "json"
path = Rails.root.join("db/products.json")
JSON.parse(File.read(path)).each do |r|
  Product.create!(
    name: r["name"],
    description: r["description"],
    brand: r["brand"],
    product_type: r["type"],
    price: r["price"],
    price_range: r["price_range"],
    free_shipping: r["free_shipping"],
    popularity: r["popularity"],
    rating: r["rating"],
    categories: r["categories"],
    hierarchical_categories: r["hierarchicalCategories"],
    object_id: r["objectID"],
    image: r["image"],
    url: r["url"]
  )
end
