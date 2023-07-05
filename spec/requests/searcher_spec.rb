require 'rails_helper'

RSpec.describe "Searchers", type: :request do
  describe "GET /search" do
    it "returns http success" do
      get "/searcher/search"
      expect(response).to have_http_status(:success)
    end
  end

end
