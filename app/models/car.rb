# representation of a vehicle
class Car < ApplicationRecord
  validates :make, :model, :color, :plate_number, :chassis, :engine, presence: true

  def to_s
    "#{model} #{plate_number}"
  end
end
