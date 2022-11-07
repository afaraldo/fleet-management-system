# In this migration add indexes
class AddIndexUniqueNumberToWorkOrders < ActiveRecord::Migration[7.0]
  def change
    remove_index :work_orders, :number
    add_index :work_orders, :number, unique: true, if_not_exists: true
    add_index :work_orders, :start_date, if_not_exists: true
    add_index :work_orders, :final_date, if_not_exists: true
    add_index :work_orders, :status, if_not_exists: true
    remove_column :work_orders, :workdays, :integer
  end
end
