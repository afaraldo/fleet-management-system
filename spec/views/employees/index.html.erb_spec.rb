require 'rails_helper'

RSpec.describe "employees/index", type: :view do
  before(:each) do
    assign(:employees, [
      Employee.create!(
        name: "Name",
        last_name: "Last Name",
        document: "Document",
        address: "Address",
        phone: "Phone"
      ),
      Employee.create!(
        name: "Name",
        last_name: "Last Name",
        document: "Document",
        address: "Address",
        phone: "Phone"
      )
    ])
  end

  it "renders a list of employees" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    # assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    # assert_select cell_selector, text: Regexp.new("Last Name".to_s), count: 2
    # assert_select cell_selector, text: Regexp.new("Document".to_s), count: 2
    # assert_select cell_selector, text: Regexp.new("Address".to_s), count: 2
    # assert_select cell_selector, text: Regexp.new("Phone".to_s), count: 2
  end
end
