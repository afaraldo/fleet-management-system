# This migration change column type in status work_orders
class ChangeColumnStatusWorkOrder < ActiveRecord::Migration[7.0]
  def change
    change_table :work_orders, bulk: true do |t|
      t.remove :status, type: :string
      t.string :status, :integer
    end
  end
end
