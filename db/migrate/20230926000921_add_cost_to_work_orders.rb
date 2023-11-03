# Migration
class AddCostToWorkOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :work_orders, :cost, :integer, null: false, default: 0
  end
end
