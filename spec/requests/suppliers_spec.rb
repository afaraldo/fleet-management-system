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

RSpec.describe "/suppliers", type: :request do
  login_user
  
  # This should return the minimal set of attributes required to create a valid
  # Supplier. As you add validations to Supplier, be sure to
  # adjust the attributes here as well.

  # Uses subclass InsuranceCarrier because Supplier is a abstract class
  let(:valid_attributes) {
    build(:insurance_carrier).attributes
  }

  let(:invalid_attributes) {
    { name: ""}
  }

  describe "GET /index" do
    it "renders a successful response" do
      InsuranceCarrier.create! valid_attributes
      get suppliers_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_supplier_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      supplier = Supplier.create! valid_attributes
      get edit_supplier_url(supplier)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Supplier" do
        expect {
          post suppliers_url, params: { supplier: valid_attributes }
        }.to change(Supplier, :count).by(1)
      end

      it "redirects to the created supplier" do
        post suppliers_url, params: { supplier: valid_attributes }
        expect(response).to redirect_to(edit_supplier_url(Supplier.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Supplier" do
        expect {
          post suppliers_url, params: { supplier: invalid_attributes }
        }.to change(Supplier, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post suppliers_url, params: { supplier: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested supplier" do
        supplier = Supplier.create! valid_attributes
        patch supplier_url(supplier), params: { supplier: new_attributes }
        supplier.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the supplier" do
        supplier = Supplier.create! valid_attributes
        patch supplier_url(supplier), params: { supplier: new_attributes }
        supplier.reload
        expect(response).to redirect_to(supplier_url(supplier))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        supplier = Supplier.create! valid_attributes
        patch supplier_url(supplier), params: { supplier: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested supplier" do
      supplier = Supplier.create! valid_attributes
      expect {
        delete supplier_url(supplier)
      }.to change(Supplier, :count).by(-1)
    end

    it "redirects to the suppliers list" do
      supplier = Supplier.create! valid_attributes
      delete supplier_url(supplier)
      expect(response).to redirect_to(suppliers_url)
    end
  end
end
