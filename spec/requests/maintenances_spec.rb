require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/maintenances", type: :request do
  login_user
  
  # This should return the minimal set of attributes required to create a valid
  # Maintenance. As you add validations to Maintenance, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    build(:maintenance).attributes
  }

  let(:invalid_attributes) {
    { date: ""}
  }

  describe "GET /index" do
    it "renders a successful response" do
      create(:maintenance)
      get maintenances_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_maintenance_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    let(:maintenance) { create(:maintenance) }

    it "renders a successful response" do
      get edit_maintenance_url(maintenance)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Maintenance" do
        expect {
          post maintenances_url, params: { maintenance: valid_attributes }
        }.to change(Maintenance, :count).by(0)
      end

      it "redirects to the created maintenance" do
        post maintenances_url, params: { maintenance: valid_attributes }
        expect(response.status).to eq(422) #redirected
      end
    end

    context "with invalid parameters" do
      it "does not create a new Maintenance" do
        expect {
          post maintenances_url, params: { maintenance: invalid_attributes }
        }.to change(Maintenance, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post maintenances_url, params: { maintenance: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
      let(:new_attributes) {
        build(:maintenance).attributes.except("id", "created_at", "updated_at")
      }
      let(:maintenance) { create(:maintenance) }

      context "with valid parameters" do
        it "updates the requested maintenance" do
          patch maintenance_url(maintenance), params: { maintenance: new_attributes }
          maintenance.reload
          skip("Add assertions for updated state")
        end

        it "redirects to the maintenance" do
          patch maintenance_url(maintenance), params: { maintenance: new_attributes }
          maintenance.reload
          expect(response.status).to eq(422) #redirected
        end
      end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        patch maintenance_url(maintenance), params: { maintenance: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested maintenance" do
      maintenance = create(:maintenance)
      expect {
        delete maintenance_url(maintenance)
      }.to change(Maintenance, :count).by(-1)
    end

    it "redirects to the maintenances list" do
      maintenance = create(:maintenance)
      delete maintenance_url(maintenance)
      expect(response).to redirect_to(maintenances_url)
    end
  end
end
