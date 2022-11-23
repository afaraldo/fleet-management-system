# This model represents a Insurance Plan
class InsurancePlan < ApplicationRecord
  has_and_belongs_to_many :cars
  belongs_to :insurance_carrier
  validates :cars, presence: true
  delegate :name, to: :insurance_carrier, prefix: true

  def to_s
    "#{self.class.model_name.human} Nro: #{id}"
  end
end
