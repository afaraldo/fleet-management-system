require 'rails_helper'

RSpec.describe "repairs/edit", type: :view do
  let(:repair) {
    Repair.create!(
      car: nil,
      mechanical_workshop: nil,
      repairs: "MyString"
    )
  }

  before(:each) do
    assign(:repair, repair)
  end

  it "renders the edit repair form" do
    render

    assert_select "form[action=?][method=?]", repair_path(repair), "post" do

      assert_select "input[name=?]", "repair[car_id]"

      assert_select "input[name=?]", "repair[mechanical_workshop_id]"

      assert_select "input[name=?]", "repair[repairs]"
    end
  end
end
