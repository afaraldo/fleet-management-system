class Car < ApplicationRecord
  validates :make, :model, :color, :plate_number, :chassis, :engine, presence: true
  validates :plate_number, uniqueness: true
end
