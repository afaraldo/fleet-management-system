# Remove references Supplier from Insurance plan
class RemoveSupplierFromInsurancePlan < ActiveRecord::Migration[7.0]
  def change
    remove_reference :insurance_plans, :supplier, null: false, foreign_key: true
    add_reference :insurance_plans, :insurance_carrier, foreign_key: { to_table: :suppliers }
  end
end
