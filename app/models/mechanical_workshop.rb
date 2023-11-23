# == Schema Information
#
# Table name: suppliers
#
#  id              :bigint           not null, primary key
#  discarded_at    :datetime
#  name            :string           not null
#  ruc             :string           not null
#  type            :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint
#
# Indexes
#
#  index_suppliers_on_discarded_at     (discarded_at)
#  index_suppliers_on_organization_id  (organization_id)
#
class MechanicalWorkshop < Supplier
  # Constants
  # Enums
  # Associations (belongs_to, has_one, has_many, has_and_belongs_to_many)
  # Extensions (includes Rails concerns)
  # Scopes
  # Validations
  # Callbacks (before_save, after_commit, etc.)
  # Delegations
  # Virtual attributes (attr_accessor, etc.)
  # Class methods (self.method)
  # Instance methods
  # Private methods
  def to_s
    name
  end
end
