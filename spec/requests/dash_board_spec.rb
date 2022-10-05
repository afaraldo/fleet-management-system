require 'rails_helper'

RSpec.describe "DashBoards", type: :request do
  login_user

  describe "GET /index" do
    it "returns http success" do
      get dash_board_index_path
      expect(response).to have_http_status(:success)
    end
  end

end
