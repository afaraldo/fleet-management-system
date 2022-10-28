FactoryBot.define do
  factory :maintenance do
    date { Faker::Date.between(from: 6.months.ago, to: Date.today) }
    budget { Faker::Number.number(digits: 5) }
    description { Faker::Lorem.sentence }
    car
    mechanical_workshop
  end
end
