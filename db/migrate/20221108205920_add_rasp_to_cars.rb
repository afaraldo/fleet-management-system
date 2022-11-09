class AddRaspToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :rasp, :string
    add_column :cars, :horometro, :boolean
  end
end
