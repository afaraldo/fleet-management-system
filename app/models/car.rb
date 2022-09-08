class Car < ApplicationRecord
  validates :make, :model, :color, :plate_number, :chassis, :engine, presence: true
end
