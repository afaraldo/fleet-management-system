# == Schema Information
#
# Table name: repairs
#
#  id                     :bigint           not null, primary key
#  date                   :date             not null
#  discarded_at           :datetime
#  repairs                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  car_id                 :bigint           not null
#  mechanical_workshop_id :bigint           not null
#  organization_id        :bigint
#
# Indexes
#
#  index_repairs_on_car_id                  (car_id)
#  index_repairs_on_discarded_at            (discarded_at)
#  index_repairs_on_mechanical_workshop_id  (mechanical_workshop_id)
#  index_repairs_on_organization_id         (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (car_id => cars.id)
#
class Repair < ApplicationRecord
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
  belongs_to :car
  belongs_to :mechanical_workshop

  delegate :name, to: :mechanical_workshop, prefix: true

  multi_tenant :organization

  def self.ransackable_attributes(_auth_object = nil)
    %w[car_id created_at date mechanical_workshop_id updated_at]
  end

  def to_s
    "Nro: #{id}"
  end
end
