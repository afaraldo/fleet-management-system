if Rails.env.test?
  AlgoliaSearch.configuration = {
    enabled: false,
    application_id: "test",
    api_key: "test"
  }
else
  AlgoliaSearch.configuration = {
    application_id: Rails.application.credentials.algolia.application_id,
    api_key: Rails.application.credentials.algolia.api_key
  }
end

