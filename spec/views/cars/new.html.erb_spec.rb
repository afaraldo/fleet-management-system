require 'rails_helper'

RSpec.describe "cars/new", type: :view do
  before(:each) do
    assign(:car, Car.new(
      make: "MyString",
      model: "MyString",
      color: "MyString",
      plate_number: "MyString",
      chassis: "MyString",
      engine: "MyString"
    ))
  end

  it "renders new car form" do
    render

    assert_select "form[action=?][method=?]", cars_path, "post" do

      assert_select "input[name=?]", "car[make]"

      #assert_select "input[name=?]", "car[model]"

      #assert_select "input[name=?]", "car[color]"

      #assert_select "input[name=?]", "car[plate_number]"

      #assert_select "input[name=?]", "car[chassis]"

      #assert_select "input[name=?]", "car[engine]"
    end
  end
end
