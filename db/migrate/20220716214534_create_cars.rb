class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :chapa
      t.string :marca
      t.string :modelo
      t.string :color
      t.string :chasis
      t.string :motor

      t.timestamps
    end
  end
end
