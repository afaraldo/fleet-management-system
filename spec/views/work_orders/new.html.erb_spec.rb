require 'rails_helper'

RSpec.describe "work_orders/new", type: :view do
  before(:each) do
    assign(:work_order, WorkOrder.new(
      requested_by: "MyString",
      reason: "MyString",
      manager: "MyString"
    ))
  end

  it "renders new work_order form" do
    render

    assert_select "form[action=?][method=?]", work_orders_path, "post" do

      assert_select "input[name=?]", "work_order[requested_by]"

      assert_select "input[name=?]", "work_order[reason]"

      assert_select "input[name=?]", "work_order[manager]"
    end
  end
end
