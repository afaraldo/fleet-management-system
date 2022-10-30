class ChangeColumnStatusWorkOrder < ActiveRecord::Migration[7.0]
  def change
    remove_column(:work_orders, :status, :string)
    add_column(:work_orders, :status, :integer)
  end
end
