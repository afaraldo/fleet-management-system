require 'rails_helper'

RSpec.describe "insurance_plans/edit", type: :view do
  let(:insurance_plan) {
    InsurancePlan.create!(
      car: nil,
      amount: 1
    )
  }

  before(:each) do
    assign(:insurance_plan, insurance_plan)
  end

  it "renders the edit insurance_plan form" do
    render

    assert_select "form[action=?][method=?]", insurance_plan_path(insurance_plan), "post" do

      assert_select "input[name=?]", "insurance_plan[car_id]"

      assert_select "input[name=?]", "insurance_plan[amount]"
    end
  end
end
