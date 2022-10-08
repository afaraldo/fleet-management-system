# Migration for Employees
class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :last_name
      t.string :document
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
