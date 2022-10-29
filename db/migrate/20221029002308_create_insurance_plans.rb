class CreateInsurancePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :insurance_plans do |t|
      t.date :contract_date, null: false
      t.references :car, null: false, foreign_key: true
      t.integer :amount, null: false
      t.date :exp_date

      t.timestamps
    end
  end
end
