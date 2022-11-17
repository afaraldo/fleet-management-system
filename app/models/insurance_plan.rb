class InsurancePlan < ApplicationRecord
  has_and_belongs_to_many :cars
  belongs_to :insurance_carrier

  delegate :plate_number, to: :car, prefix: true

  def full_name
    "#{insurance_carrier.name}"
  end

  def to_s
    full_name
  end
end
