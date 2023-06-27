# This migration should add column current_mileage,next_mileage and remove column budget
class AddMileageToMaintenance < ActiveRecord::Migration[7.0]
  def change
    change_table :maintenances, bulk: true do |t|
      t.remove :budget, type: :integer
      t.integer :current_mileage
      t.integer :next_mileage
    end
  end
end
