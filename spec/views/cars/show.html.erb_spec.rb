require 'rails_helper'

RSpec.describe "cars/show", type: :view do
  before(:each) do
    @car = assign(:car, Car.create!(
      make: "Make",
      model: "Model",
      color: "Color",
      plate_number: "Plate Number",
      chassis: "Chassis",
      engine: "Engine"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Make/)
    expect(rendered).to match(/Model/)
    expect(rendered).to match(/Color/)
    expect(rendered).to match(/Plate Number/)
    expect(rendered).to match(/Chassis/)
    expect(rendered).to match(/Engine/)
  end
end
