# representation of a vehicle
class Car < ApplicationRecord
  has_many :work_orders, dependent: :destroy
  has_and_belongs_to_many :insurance_plans

  validates :make, :model, :plate_number, presence: true

  def to_s
    "#{make} #{model} #{plate_number}"
  end
end
