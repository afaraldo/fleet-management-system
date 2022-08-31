require 'rails_helper'

RSpec.describe "DashBoards", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/dash_board/index"
      expect(response).to have_http_status(:success)
    end
  end

end
