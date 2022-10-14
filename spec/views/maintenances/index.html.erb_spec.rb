require 'rails_helper'

RSpec.describe "maintenances/index", type: :view do
  before(:each) do
    assign(:maintenances, [
      Maintenance.create!(
        mechanical_workshop: nil,
        budget: 2,
        car: nil,
        description: "Description"
      ),
      Maintenance.create!(
        mechanical_workshop: nil,
        budget: 2,
        car: nil,
        description: "Description"
      )
    ])
  end

  it "renders a list of maintenances" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
  end
end
