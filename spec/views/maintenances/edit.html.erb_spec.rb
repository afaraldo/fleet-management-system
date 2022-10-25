require 'rails_helper'

RSpec.describe "maintenances/edit", type: :view do
  before(:each) do
    @maintenance = assign(:maintenance, Maintenance.create!(
      mechanical_workshop: nil,
      budget: 1,
      car: nil,
      description: "MyString"
    ))
  end

  it "renders the edit maintenance form" do
    render

    assert_select "form[action=?][method=?]", maintenance_path(@maintenance), "post" do

      assert_select "input[name=?]", "maintenance[mechanical_workshop_id]"

      assert_select "input[name=?]", "maintenance[budget]"

      assert_select "input[name=?]", "maintenance[car_id]"

      assert_select "input[name=?]", "maintenance[description]"
    end
  end
end
