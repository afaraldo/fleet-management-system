class AddColumnsToWorkOrders < ActiveRecord::Migration[7.0]
  def change
    change_column(:work_orders, :date, :datetime)
    add_column(:work_orders, :status, :string)
  end
end
