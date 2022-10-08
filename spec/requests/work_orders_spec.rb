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

RSpec.describe "/work_orders", type: :request do
  login_user

  before { host! "localhost:3000" }

  # This should return the minimal set of attributes required to create a valid
  # WorkOrder. As you add validations to WorkOrder, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      WorkOrder.create! valid_attributes
      get work_orders_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      work_order = WorkOrder.create! valid_attributes
      get work_order_url(work_order)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_work_order_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      work_order = WorkOrder.create! valid_attributes
      get edit_work_order_url(work_order)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new WorkOrder" do
        expect {
          post work_orders_url, params: { work_order: valid_attributes }
        }.to change(WorkOrder, :count).by(1)
      end

      it "redirects to the created work_order" do
        post work_orders_url, params: { work_order: valid_attributes }
        expect(response).to redirect_to(work_order_url(WorkOrder.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new WorkOrder" do
        expect {
          post work_orders_url, params: { work_order: invalid_attributes }
        }.to change(WorkOrder, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post work_orders_url, params: { work_order: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested work_order" do
        work_order = WorkOrder.create! valid_attributes
        patch work_order_url(work_order), params: { work_order: new_attributes }
        work_order.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the work_order" do
        work_order = WorkOrder.create! valid_attributes
        patch work_order_url(work_order), params: { work_order: new_attributes }
        work_order.reload
        expect(response).to redirect_to(work_order_url(work_order))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        work_order = WorkOrder.create! valid_attributes
        patch work_order_url(work_order), params: { work_order: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested work_order" do
      work_order = WorkOrder.create! valid_attributes
      expect {
        delete work_order_url(work_order)
      }.to change(WorkOrder, :count).by(-1)
    end

    it "redirects to the work_orders list" do
      work_order = WorkOrder.create! valid_attributes
      delete work_order_url(work_order)
      expect(response).to redirect_to(work_orders_url)
    end
  end
end
