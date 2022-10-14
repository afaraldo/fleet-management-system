require 'rails_helper'

RSpec.describe "maintenances/new", type: :view do
  before(:each) do
    assign(:maintenance, Maintenance.new(
      mechanical_workshop: nil,
      budget: 1,
      car: nil,
      description: "MyString"
    ))
  end

  it "renders new maintenance form" do
    render

    assert_select "form[action=?][method=?]", maintenances_path, "post" do

      assert_select "input[name=?]", "maintenance[mechanical_workshop_id]"

      assert_select "input[name=?]", "maintenance[budget]"

      assert_select "input[name=?]", "maintenance[car_id]"

      assert_select "input[name=?]", "maintenance[description]"
    end
  end
end
