# This migration drops work_orders table and recreates it.
class DropWorkOrders < ActiveRecord::Migration[7.0]
  def change
    drop_table(:work_orders, if_exists: true) do |t|
      t.date :date
      t.string :requested_by
      t.string :reason
      t.string :manager

      t.timestamps
    end
  end
end
