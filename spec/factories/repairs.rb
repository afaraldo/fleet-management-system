FactoryBot.define do
  factory :repair do
    date { Faker::Date.between(from: 6.months.ago, to: Date.today) }
    repairs { Faker::Lorem.sentence }
    car
    mechanical_workshop
  end
end
