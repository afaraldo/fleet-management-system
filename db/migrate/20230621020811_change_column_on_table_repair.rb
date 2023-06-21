# This migration changes the date column to not null in repairs
class ChangeColumnOnTableRepair < ActiveRecord::Migration[7.0]
  def change
    change_column_null :repairs, :date, false
  end
end
