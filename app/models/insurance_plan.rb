# This model represents a Insurance Plan
class InsurancePlan < ApplicationRecord
  has_and_belongs_to_many :cars
  belongs_to :insurance_carrier
  validates :cars, presence: true
  delegate :name, to: :insurance_carrier, prefix: true

  def to_s
    "#{self.class.model_name.human} Nro: #{id}"
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[amount contract_date created_at type_coverage expiry_date id insurance_carrier_id updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[cars insurance_carrier versions]
  end
end
