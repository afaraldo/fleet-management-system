# Migration for Supplier
class CreateSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers do |t|
      t.string :name, null: false
      t.string :ruc, null: false
      t.string :type, null: false

      t.timestamps
    end
  end
end
