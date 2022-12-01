FactoryBot.define do
  factory :car do
    make { Faker::Vehicle.make }
    model { Faker::Vehicle.model }
    color { Faker::Color.hex_color }
    plate_number { Faker::Vehicle.license_plate }
    chassis { Faker::Vehicle.car_type }
    engine { Faker::Vehicle.engine }
    rasp { Faker::Number.number(digits: 6) }
    horometro { Faker::Boolean.boolean }
  end
end
