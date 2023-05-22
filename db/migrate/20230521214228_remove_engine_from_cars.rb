# Remove engine from Cars
class RemoveEngineFromCars < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :engine, :string
  end
end
