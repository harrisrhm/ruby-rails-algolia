class Product < ApplicationRecord
  include AlgoliaSearch

  # If you stored JSON in text on SQLite:
  # serialize :hierarchical_categories, JSON

  algoliasearch index_name: "products_#{Rails.env}" do
    # Send all the fields you need, including the nested hierarchicalCategories
    attributes :name, :description, :brand, :product_type, :price, :price_range,
               :free_shipping, :popularity, :rating, :categories, :hierarchicalCategories, :image, :url

    # Build the nested object { "lvl0": "...", "lvl1": "...", ... }
    attribute :hierarchicalCategories do
      hc = hierarchical_categories.is_a?(Hash) ? hierarchical_categories : {}
      {
        lvl0: hc["lvl0"],
        lvl1: hc["lvl1"],
        lvl2: hc["lvl2"],
        lvl3: hc["lvl3"]
      }.compact
    end

    # Make those fields searchable (optional but handy)
    searchableAttributes %w[
      name
      unordered(description)
      brand
      categories
      hierarchicalCategories.lvl0
      hierarchicalCategories.lvl1
      hierarchicalCategories.lvl2
      hierarchicalCategories.lvl3
      product_type
    ]

    # Crucial: allow faceting on the dot-paths
    attributesForFaceting %w[
      searchable(categories)
      brand
      price_range
      free_shipping
      hierarchicalCategories.lvl0
      hierarchicalCategories.lvl1
      hierarchicalCategories.lvl2
      hierarchicalCategories.lvl3
    ]

    customRanking ["desc(popularity)"]
  end
end


