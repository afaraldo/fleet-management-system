require "rails_helper"

RSpec.describe NotificationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/users/1/notifications").to route_to("notifications#index", user_id: "1")
    end

    it "routes to #show" do
      expect(get: "/users/1/notifications/1").to route_to("notifications#show", id: "1", user_id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/users/1/notifications/1").to route_to("notifications#destroy", id: "1", user_id: "1")
    end
  end
end
