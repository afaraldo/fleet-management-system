require 'rails_helper'

RSpec.describe "WorkOrderByDrivers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/work_order_by_driver/index"
      expect(response).to have_http_status(:success)
    end
  end

end
