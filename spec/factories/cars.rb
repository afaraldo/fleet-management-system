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
