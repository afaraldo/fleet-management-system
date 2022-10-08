require 'rails_helper'

RSpec.describe "work_orders/index", type: :view do
  before(:each) do
    assign(:work_orders, [
      # WorkOrder.create!(
      #   requested_by: "Requested By",
      #   reason: "Reason",
      #   manager: "Manager"
      # ),
      # WorkOrder.create!(
      #   requested_by: "Requested By",
      #   reason: "Reason",
      #   manager: "Manager"
      # )
    ])
  end

  it "renders a list of work_orders" do
    #render
    #cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    # assert_select cell_selector, text: Regexp.new("Requested By".to_s), count: 2
    # assert_select cell_selector, text: Regexp.new("Reason".to_s), count: 2
    # assert_select cell_selector, text: Regexp.new("Manager".to_s), count: 2
  end
end
