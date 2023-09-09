class AddIndexesToCarsInsurancePlans < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :cars_insurance_plans, :cars
    add_foreign_key :cars_insurance_plans, :insurance_plans
  end
end
