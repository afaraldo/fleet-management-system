# Migration
class AddUniqueToDocumentEmployee < ActiveRecord::Migration[7.0]
  def change
    add_index :employees, :document, unique: true
  end
end
