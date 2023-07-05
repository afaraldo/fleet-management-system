# == Schema Information
#
# Table name: cars
#
#  id                  :bigint           not null, primary key
#  assigned_dependency :string
#  chassis             :string
#  color               :string
#  horometro           :boolean          default(FALSE), not null
#  make                :string
#  model               :string
#  plate_number        :string
#  rasp                :string
#  type_car            :string           not null
#  year                :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_cars_on_rasp  (rasp)
#
FactoryBot.define do
  factory :car do
    make { Faker::Vehicle.make }
    model { Faker::Vehicle.model }
    color { Faker::Color.hex_color }
    plate_number { Faker::Vehicle.license_plate }
    chassis { Faker::Vehicle.car_type }
    rasp { Faker::Number.number(digits: 6) }
    horometro { Faker::Boolean.boolean }
    year { Faker::Vehicle.year }
    type_car { Faker::Vehicle.car_type }
  end
end
