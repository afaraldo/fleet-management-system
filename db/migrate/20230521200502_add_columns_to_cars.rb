# This migration should add column year, assingend_dependency, type_car
class AddColumnsToCars < ActiveRecord::Migration[7.0]
  def change
    change_table :cars, bulk: true do |t|
      t.integer :year
      t.string  :assigned_dependency
      t.string  :type_car, null: false
    end
  end
end
