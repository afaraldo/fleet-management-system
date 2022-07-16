class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :nombre
      t.string :apellido
      t.string :documento
      t.string :direccion
      t.string :telefono

      t.timestamps
    end
  end
end
