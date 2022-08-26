require 'rails_helper'

RSpec.describe "employees/new", type: :view do
  before(:each) do
    assign(:employee, Employee.new(
      name: "MyString",
      last_name: "MyString",
      document: "MyString",
      address: "MyString",
      phone: "MyString"
    ))
  end

  it "renders new employee form" do
    render

    assert_select "form[action=?][method=?]", employees_path, "post" do

      assert_select "input[name=?]", "employee[name]"

      assert_select "input[name=?]", "employee[last_name]"

      assert_select "input[name=?]", "employee[document]"

      assert_select "input[name=?]", "employee[address]"

      assert_select "input[name=?]", "employee[phone]"
    end
  end
end
