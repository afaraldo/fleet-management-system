require "rails_helper"

RSpec.describe InsurancePlansController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/insurance_plans").to route_to("insurance_plans#index")
    end

    it "routes to #new" do
      expect(get: "/insurance_plans/new").to route_to("insurance_plans#new")
    end

    it "routes to #show" do
      expect(get: "/insurance_plans/1").to route_to("insurance_plans#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/insurance_plans/1/edit").to route_to("insurance_plans#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/insurance_plans").to route_to("insurance_plans#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/insurance_plans/1").to route_to("insurance_plans#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/insurance_plans/1").to route_to("insurance_plans#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/insurance_plans/1").to route_to("insurance_plans#destroy", id: "1")
    end
  end
end
