FactoryBot.define do
  factory :car do
    make { Faker::Name.unique.clear }
    model { Faker::Company.name }
    color { Faker::Color.color_name }
    plate_number { Faker::Number.number(digits: 6) }
    chassis { Faker::Name.name }
    engine { Faker::Name.name }
  end
end
