class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.string :color
      t.string :plate_number
      t.string :chassis
      t.string :engine

      t.timestamps
    end
  end
end
