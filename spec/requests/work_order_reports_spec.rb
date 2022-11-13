require 'rails_helper'

RSpec.describe "WorkOrderReports", type: :request do
  login_user

  describe "GET /index" do
    subject { 2.times { create(:work_order) } }
    it "renders a successful response" do
      get work_order_reports_url
      expect(response).to be_successful
    end
  end
end
