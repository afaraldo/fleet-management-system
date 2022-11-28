# Add index to expiry date
class AddIndexToExpiryDate < ActiveRecord::Migration[7.0]
  def change
    add_index :insurance_plans, :expiry_date
  end
end
