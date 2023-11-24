# Migration
class AddUniqueIndexToCars < ActiveRecord::Migration[7.0]
  def change
    add_index :cars, %i[plate_number organization_id], unique: true
  end
end
