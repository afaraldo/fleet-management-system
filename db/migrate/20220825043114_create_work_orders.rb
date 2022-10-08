# Migration for Work_Orders
class CreateWorkOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :work_orders do |t|
      t.date :date
      t.string :requested_by
      t.string :reason
      t.string :manager

      t.timestamps
    end
  end
end
