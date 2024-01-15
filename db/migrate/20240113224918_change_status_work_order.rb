# Migration
class ChangeStatusWorkOrder < ActiveRecord::Migration[7.0]
  def change
    change_column :work_orders, :status, :string
  end
end
