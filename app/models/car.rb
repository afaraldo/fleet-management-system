# representation of a vehicle
class Car < ApplicationRecord
  has_many :work_orders, dependent: :destroy
  has_many :maintenances, dependent: :destroy
  has_and_belongs_to_many :insurance_plans
  delegate :plate_number, to: :insurance_plans, prefix: true

  validates :type_car, :make, :model, :plate_number, presence: true

  def to_s
    "#{type_car} #{make} #{model} #{plate_number}"
  end
end
