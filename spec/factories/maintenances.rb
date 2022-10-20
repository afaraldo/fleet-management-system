FactoryBot.define do
  factory :maintenance do
=begin
    date { Faker::Date.between(from: 6.months.ago, to: Date.today) }
    mechanical_workshop
    budget { Faker::Number.number}
    car
    description { Faker::Lorem.sentence }
=end
  end
end
