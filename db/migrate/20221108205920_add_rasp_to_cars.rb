# This migration add new column to cars
class AddRaspToCars < ActiveRecord::Migration[7.0]
  def change
    change_table :cars, bulk: true do |t|
      t.string :rasp, index: true
      t.boolean :horometro, null: false, default: false
    end
  end
end
