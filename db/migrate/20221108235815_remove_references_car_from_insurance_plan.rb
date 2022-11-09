# Remove references from Insurance plan
class RemoveReferencesCarFromInsurancePlan < ActiveRecord::Migration[7.0]
  def change
    remove_reference :insurance_plans, :car, null: false, foreign_key: true
  end
end
