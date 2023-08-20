# Migration
class AddUniqueToPlateNumberCars < ActiveRecord::Migration[7.0]
  def change
    add_index :cars, :plate_number, unique: true
  end
end
