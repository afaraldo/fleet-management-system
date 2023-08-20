# == Schema Information
#
# Table name: insurance_plans
#
#  id                   :bigint           not null, primary key
#  amount               :integer          not null
#  contract_date        :date             not null
#  expiry_date          :date
#  type_coverage        :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  insurance_carrier_id :bigint
#
# Indexes
#
#  index_insurance_plans_on_expiry_date           (expiry_date)
#  index_insurance_plans_on_insurance_carrier_id  (insurance_carrier_id)
#
# Foreign Keys
#
#  fk_rails_...  (insurance_carrier_id => suppliers.id)
#
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
