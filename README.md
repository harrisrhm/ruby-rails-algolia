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

```bash
git clone <YOUR_REPO_URL>.git
cd <YOUR_REPO_NAME>

# Use Ruby 3.2.x locally (example: 3.2.5)
rbenv install -s 3.2.5
rbenv local 3.2.5

# Install gems
bundle install

---

## 2) Configure environment

Create a `.env` file at the project root (or set these in your shell/CI):

```dotenv
ALGOLIA_APP_ID=YourAppID
ALGOLIA_SEARCH_API_KEY=YourSearchOnlyKey
ALGOLIA_ADMIN_API_KEY=YourAdminKey

---

## 3) Database setup

SQLite (default):

```bash
# Create the database and run migrations
bin/rails db:create db:migrate

# (Optional) load sample JSON data if necessary
bin/rails db:seed

---

## 4) Index to Algolia

Reindex whenever you change what the `Product` model sends to Algolia
(e.g., add `:image`, `:url`, or `hierarchicalCategories`):

```bash
bin/rails runner 'Product.reindex'

---

## 5) Run the app

Start the Rails server, then open **http://localhost:3000** in your browser (this is the default URL/port).

```bash
# Start the Rails server
bin/rails s