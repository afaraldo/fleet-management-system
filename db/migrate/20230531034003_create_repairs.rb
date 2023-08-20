# Migration for Repairs
class CreateRepairs < ActiveRecord::Migration[7.0]
  def change
    create_table :repairs do |t|
      t.date :date
      t.references :car, null: false, foreign_key: true
      t.references :mechanical_workshop, null: false
      t.string :repairs

      t.timestamps
    end
  end
end
