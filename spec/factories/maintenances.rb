FactoryBot.define do
  factory :maintenance do
    date { Faker::Date.between(from: 6.months.ago, to: Date.today) }
    current_mileage { Faker::Number.between(from: 1, to: 99999) }
    next_mileage { Faker::Number.between(from: 1, to: 99999) }
    description { Faker::Lorem.sentence }
    car
    mechanical_workshop
  end
end
