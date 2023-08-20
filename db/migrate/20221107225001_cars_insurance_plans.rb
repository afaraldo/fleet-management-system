# Create an intermediate table of cars and insurance plan
class CarsInsurancePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :cars_insurance_plans do |t|
      t.references :car
      t.references :insurance_plan

      t.timestamps
    end
  end
end
