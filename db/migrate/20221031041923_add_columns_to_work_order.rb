class AddColumnsToWorkOrder < ActiveRecord::Migration[7.0]
  def change
    change_table :work_orders, bulk: true do |t|
      t.remove :date, type: :date
      t.datetime :start_date, null: false
      t.datetime :final_date, null: false
      t.integer :final_oil
    end
  end
end
