# migration
class AddUserToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_reference :employees, :user
  end
end
