class AddUniqueIndexToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_index :employees, %i[document organization_id], unique: true
  end
end
