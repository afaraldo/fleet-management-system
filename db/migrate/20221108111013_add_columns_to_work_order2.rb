# This migration fix type column status
class AddColumnsToWorkOrder2 < ActiveRecord::Migration[7.0]
  def change
    change_table :work_orders, bulk: true do |t|
      t.remove :status, type: :string
      t.integer :status, null: false, index: true, default: 0
    end
  end
end
