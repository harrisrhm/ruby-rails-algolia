# Rails + Algolia InstantSearch Demo

A minimal Rails app connected to Algolia with InstantSearch.js.  
Features a search box, sidebar facets (brand, price, free shipping, hierarchical categories), and product cards with image, name, description, and price.

---

## Prerequisites

- Ruby **≥ 3.2** (recommend `rbenv`)
- Bundler
- Node.js (only if you use `bin/dev` with a JS bundler)
- An Algolia application with:
  - **App ID**
  - **Search-only API key** (for searching)
  - **Admin API key** (for indexing)

---

## Installation

1. Download the repository onto your project directory:
```sh
git clone <YOUR_REPO_URL>.git
cd <YOUR_REPO_NAME>
```

2. Use Ruby 3.2.x locally (example: 3.2.5):
```sh
rbenv install -s 3.2.5
rbenv local 3.2.5
```

3. Install gems:
```sh
bundle install
```

4. Create a `.env` file at the project root:
```sh
ALGOLIA_APP_ID=YourAppID
ALGOLIA_SEARCH_API_KEY=YourSearchOnlyKey
ALGOLIA_ADMIN_API_KEY=YourAdminKey
```

5. Create the database and run migrations:
```sh
bin/rails db:create db:migrate
```

(Optional) load sample JSON data
```sh
bin/rails db:seed
```
> **Note:** This step is necessary when you need sample data locally and loaded initially

6) Index to Algolia

Reindex whenever you change what the `Product` model sends to Algolia
(e.g., add `:image`, `:url`, or `hierarchicalCategories`):

```sh
bin/rails runner 'Product.reindex'
```

7) Run the app

Start the Rails server, then open http://localhost:3000 in your browser (this is the default URL/port).

```sh
bin/rails s
```