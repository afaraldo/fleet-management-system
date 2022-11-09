class InsurancePlan < ApplicationRecord
  has_and_belongs_to_many :cars
  belongs_to :insurance_carrier
end
