# This migration should add column datetime and status
class AddColumnsToWorkOrders < ActiveRecord::Migration[7.0]
  def change
    change_table :work_orders, bulk: true do |t|
      t.remove :date, type: :date
      t.time :date, null: false
      t.string :status, null: false
    end
  end
end
