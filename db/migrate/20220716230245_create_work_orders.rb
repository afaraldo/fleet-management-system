# Migration for WorkOrder
class CreateWorkOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :work_orders do |t|
      t.date :fecha
      t.string :solicitado_por
      t.string :encargado

      t.timestamps
    end
  end
end
