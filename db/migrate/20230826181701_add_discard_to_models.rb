class AddDiscardToModels < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :discarded_at, :datetime
    add_index :cars, :discarded_at

    add_column :employees, :discarded_at, :datetime
    add_index :employees, :discarded_at

    add_column :suppliers, :discarded_at, :datetime
    add_index :suppliers, :discarded_at

    add_column :insurance_plans, :discarded_at, :datetime
    add_index :insurance_plans, :discarded_at

    add_column :maintenances, :discarded_at, :datetime
    add_index :maintenances, :discarded_at

    add_column :repairs, :discarded_at, :datetime
    add_index :repairs, :discarded_at

    add_column :work_orders, :discarded_at, :datetime
    add_index :work_orders, :discarded_at

    add_column :users, :discarded_at, :datetime
    add_index :users, :discarded_at
  end
end
