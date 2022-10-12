# Migration for Supplier
class CreateSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :ruc
      t.string :type

      t.timestamps
    end
  end
end
