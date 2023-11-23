# == Schema Information
#
# Table name: maintenances
#
#  id                     :bigint           not null, primary key
#  current_mileage        :integer
#  date                   :date             not null
#  description            :string
#  discarded_at           :datetime
#  next_mileage           :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  car_id                 :bigint           not null
#  mechanical_workshop_id :bigint           not null
#  organization_id        :bigint
#
# Indexes
#
#  index_maintenances_on_car_id                  (car_id)
#  index_maintenances_on_discarded_at            (discarded_at)
#  index_maintenances_on_mechanical_workshop_id  (mechanical_workshop_id)
#  index_maintenances_on_organization_id         (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (car_id => cars.id)
#  fk_rails_...  (mechanical_workshop_id => suppliers.id)
#
class Maintenance < ApplicationRecord
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
  belongs_to :mechanical_workshop
  belongs_to :car

  delegate :name, to: :mechanical_workshop, prefix: true

  multi_tenant :organization

  def to_s
    "Nro: #{id}"
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[current_mileage next_mileage car_id created_at date description id mechanical_workshop_id updated_at]
  end
end
