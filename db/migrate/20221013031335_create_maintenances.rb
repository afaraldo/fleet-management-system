# Migration for Maintenance
class CreateMaintenances < ActiveRecord::Migration[7.0]
  def change
    create_table :maintenances do |t|
      t.date :date, null: false
      t.references :mechanical_workshop, null: false, foreign_key: { to_table: :suppliers }
      t.integer :budget
      t.references :car, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
