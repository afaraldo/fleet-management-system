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

RSpec.describe "/cars", type: :request do
  login_user

  # This should return the minimal set of attributes required to create a valid
  # Car. As you add validations to Car, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    hash = build(:car).attributes
    hash.extract!("id")
    hash
  }

  let(:invalid_attributes) {
    { make: ""}
  }

  describe "GET /index" do
    it "renders a successful response" do
      create(:car)
      get cars_url
      expect(response).to be_successful
      expect(Car.count).to eq(1)
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_car_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    let(:car) { create(:car) }

    it "renders a successful response" do
      get edit_car_url(car)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Car" do
        expect {
          post cars_url, params: { car: valid_attributes }
        }.to change(Car, :count).by(1)
      end

      it "render to the created car" do
        post cars_url, params: { car: valid_attributes }
        expect(response.status).to eq(302) #redirected
      end
    end

    context "with invalid parameters" do
      it "does not create a new Car" do
        expect {
          post cars_url, params: { car: invalid_attributes }
        }.to change(Car, :count).by(0)
      end
    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post cars_url, params: { car: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do

    let(:new_attributes) {
      build(:car).attributes.except("id", "created_at", "updated_at")
    }

    let(:car) { create(:car) }

    context "with valid parameters" do
      it "updates the requested car" do
        patch car_url(car), params: { car: new_attributes }
        car.reload
        new_attributes.keys.each do |key|
          expect(car.send key).to eq(new_attributes[key])
        end
      end

      it "redirects to the car" do
        patch car_url(car), params: { car: new_attributes }
        car.reload
        expect(response.status).to eq(302) #redirected
      end
    end

    context "with invalid parameters" do

      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        patch car_url(car), params: { car: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested car" do
      car = Car.create! valid_attributes
      expect {
        delete car_url(car)
      }.to change(Car, :count).by(-1)
    end

    it "redirects to the cars list" do
      car = Car.create! valid_attributes
      delete car_url(car)
      expect(response).to redirect_to(cars_url)
    end
  end
end
