class AddReferencesCarToWorkOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :work_orders, :car, foreign_key: true
    add_foreign_key :work_orders, :employees
  end
end
