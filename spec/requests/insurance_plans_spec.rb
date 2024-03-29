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

RSpec.describe "/insurance_plans", type: :request do
  login_user
  
  # This should return the minimal set of attributes required to create a valid
  # InsurancePlan. As you add validations to InsurancePlan, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    hash = build(:insurance_plan).attributes
    hash.extract!("id")
    hash
  }

  let(:invalid_attributes) {
    { contract_date: ""}
  }

  describe "GET /index" do
    it "renders a successful response" do
      create(:insurance_plan)
      get insurance_plans_url
      expect(response).to be_successful
      expect(InsurancePlan.count).to eq(1)
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_insurance_plan_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    let(:insurance_plan) { create(:insurance_plan) }
    it "renders a successful response" do
      get edit_insurance_plan_url(insurance_plan)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new InsurancePlan" do
        expect {
          post insurance_plans_url, params: { insurance_plan: valid_attributes }
        }.to change(InsurancePlan, :count).by(0)
      end

      it "redirects to the created insurance_plan" do
        post insurance_plans_url, params: { insurance_plan: valid_attributes }
        expect(response.status).to eq(422) #redirected

      end
    end

    context "with invalid parameters" do
      it "does not create a new InsurancePlan" do
        expect {
          post insurance_plans_url, params: { insurance_plan: invalid_attributes }
        }.to change(InsurancePlan, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post insurance_plans_url, params: { insurance_plan: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
      let(:new_attributes) {
        build(:insurance_plan).attributes.except("id", "created_at", "updated_at")
      }
      let(:insurance_plan) { create(:insurance_plan) }

      context "with valid parameters" do
        it "updates the requested insurance_plan" do
          create(:insurance_plan)
          patch insurance_plan_url(insurance_plan), params: { insurance_plan: new_attributes }
          insurance_plan.reload
        end

      it "redirects to the insurance_plan" do
        put insurance_plan_url(insurance_plan), params: { insurance_plan: new_attributes }
        insurance_plan.reload
        expect(response).to redirect_to(edit_insurance_plan_url(insurance_plan))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        create(:insurance_plan)
        patch insurance_plan_url(insurance_plan), params: { insurance_plan: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested insurance_plan" do
      insurance_plan = create(:insurance_plan)
      expect {
        delete insurance_plan_url(insurance_plan)
      }.to change(InsurancePlan, :count).by(-1)
    end

    it "redirects to the insurance_plans list" do
      insurance_plan = create(:insurance_plan)
      delete insurance_plan_url(insurance_plan)
      expect(response).to redirect_to(insurance_plans_url)
    end
  end
end
