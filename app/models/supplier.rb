class Supplier < ApplicationRecord
  validates :type, presence: true
  # Law of Demeter
  delegate :name, to: :mechanical_workshop, prefix: true
  delegate :name, to: :insurance_carrier, prefix: true
end
