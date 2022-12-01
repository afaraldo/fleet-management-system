require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /email:string" do
    it "returns http success" do
      get "/user/email:string"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /avatar:string" do
    it "returns http success" do
      get "/user/avatar:string"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /password:string" do
    it "returns http success" do
      get "/user/password:string"
      expect(response).to have_http_status(:success)
    end
  end

end
