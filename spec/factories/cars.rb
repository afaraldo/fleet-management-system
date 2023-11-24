# == Schema Information
#
# Table name: cars
#
#  id                  :bigint           not null, primary key
#  assigned_dependency :string
#  chassis             :string
#  color               :string
#  discarded_at        :datetime
#  horometro           :boolean          default(FALSE), not null
#  make                :string
#  model               :string
#  plate_number        :string
#  rasp                :string
#  type_car            :string           not null
#  year                :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  organization_id     :bigint
#
# Indexes
#
#  index_cars_on_discarded_at                      (discarded_at)
#  index_cars_on_organization_id                   (organization_id)
#  index_cars_on_plate_number                      (plate_number)
#  index_cars_on_plate_number_and_organization_id  (plate_number,organization_id) UNIQUE
#  index_cars_on_rasp                              (rasp)
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
