# In this migration add indexes
class AddIndexUniqueNumberToWorkOrders < ActiveRecord::Migration[7.0]
  def change
    change_table :work_orders, bulk: true do |t|
      t.remove :workdays, type: :integer
      t.string :area, null: false
    end
    remove_index :work_orders, :number
    add_index :work_orders, :number, if_not_exists: true
    add_index :work_orders, :start_date, if_not_exists: true
    add_index :work_orders, :final_date, if_not_exists: true
    add_index :work_orders, :status, if_not_exists: true
  end
end
