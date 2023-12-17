# migration
class AddIndexUniqueToUsers < ActiveRecord::Migration[7.0]
  def change
    add_index :users, %i[email organization_id], unique: true
  end
end
