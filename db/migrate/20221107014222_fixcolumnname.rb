# Fix column name the exp_date to expiry_date
class Fixcolumnname < ActiveRecord::Migration[7.0]
  def change
    rename_column :insurance_plans, :exp_date, :expiry_date
  end
end
