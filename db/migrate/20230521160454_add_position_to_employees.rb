# This migration should add column position
class AddPositionToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :position, :string
  end
end
