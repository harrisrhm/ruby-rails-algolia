require "algolia"

AlgoliaSearch.configuration = {
  application_id: ENV.fetch("ALGOLIA_APP_ID"),
  api_key:        ENV.fetch("ALGOLIA_ADMIN_API_KEY")
}