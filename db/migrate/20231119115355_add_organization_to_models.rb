# Migration
class AddOrganizationToModels < ActiveRecord::Migration[7.0]
  def change
    add_reference :cars, :organization
    add_reference :work_orders, :organization
    add_reference :employees, :organization
    add_reference :insurance_plans, :organization
    add_reference :maintenances, :organization
    add_reference :notifications, :organization
    add_reference :suppliers, :organization
    add_reference :repairs, :organization
    add_reference :users, :organization

  end
end
