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

## 1) Clone & install

```bash
git clone <YOUR_REPO_URL>.git
cd <YOUR_REPO_NAME>

# Use Ruby 3.2.x locally (example: 3.2.5)
rbenv install -s 3.2.5
rbenv local 3.2.5

# Install gems
bundle install
