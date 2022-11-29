# remove default column
class AddColumnsToWorkOrder3 < ActiveRecord::Migration[7.0]
  def change
    change_table :work_orders, bulk: true do |t|
      t.remove :status, type: :integer
      t.integer :status, null: false, index: true
    end
  end
end
