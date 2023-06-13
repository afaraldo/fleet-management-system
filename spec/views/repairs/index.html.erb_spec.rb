require 'rails_helper'

RSpec.describe "repairs/index", type: :view do
  before(:each) do
    assign(:repairs, [
      # Repair.create!(
      #   car: nil,
      #   mechanical_workshop: nil,
      #   repairs: "Repairs"
      # ),
      # Repair.create!(
      #   car: nil,
      #   mechanical_workshop: nil,
      #   repairs: "Repairs"
      # )
    ])
  end

  it "renders a list of repairs" do
    # render
    # cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    # assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    # assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    # assert_select cell_selector, text: Regexp.new("Repairs".to_s), count: 2
  end
end
