require 'rails_helper'

RSpec.describe "cars/index", type: :view do
  before(:each) do
    assign(:cars, [
      Car.create!(
        make: "Make",
        model: "Model",
        color: "Color",
        plate_number: "Plate Number",
        chassis: "Chassis",
        engine: "Engine"
      ),
      Car.create!(
        make: "Make",
        model: "Model",
        color: "Color",
        plate_number: "Plate Number",
        chassis: "Chassis",
        engine: "Engine"
      )
    ])
  end

  it "renders a list of cars" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Make".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Model".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Color".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Plate Number".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Chassis".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Engine".to_s), count: 2
  end
end
