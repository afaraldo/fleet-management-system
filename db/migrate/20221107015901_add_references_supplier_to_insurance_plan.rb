# Add references to Insurance plan
class AddReferencesSupplierToInsurancePlan < ActiveRecord::Migration[7.0]
  def change
    add_reference :insurance_plans, :supplier, foreign_key: true
  end
end
