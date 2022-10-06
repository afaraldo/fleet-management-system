class CreateWorkOrder < ActiveRecord::Migration[7.0]
  def change
    create_table(:work_orders) do |t|
      t.date :date, null: false
      t.bigint :number, null: false
      t.string :description, null: false
      t.string :city
      t.integer :workdays
      t.integer :start_mileage
      t.integer :final_mileage
      t.references :employee

      t.timestamps
    end

    add_index :work_orders, :date
    add_index :work_orders, :number
    add_index :work_orders, :description
    add_index :work_orders, :city
  end
end
