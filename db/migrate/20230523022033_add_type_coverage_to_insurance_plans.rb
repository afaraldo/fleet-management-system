class AddTypeCoverageToInsurancePlans < ActiveRecord::Migration[7.0]
  def change
    add_column :insurance_plans, :type_coverage, :string
  end
end
