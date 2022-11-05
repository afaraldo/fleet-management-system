require 'rails_helper'

RSpec.describe "insurance_plans/index", type: :view do
  before(:each) do
    # assign(:insurance_plans, [
    #   InsurancePlan.create!(
    #     car: nil,
    #     amount: 2
    #   ),
    #   InsurancePlan.create!(
    #     car: nil,
    #     amount: 2
    #   )
    # ])
  end

  it "renders a list of insurance_plans" do
    # render
    # cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    # assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    # assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
