FactoryBot.define do
  factory :work_order do
    date { Faker::Date.between(from: 6.months.ago, to: Date.today) }
    number { Faker::Number.number(digits: 5) }
    description { Faker::Lorem.sentence }
    city { Faker::Lorem.sentence }
    workdays { Faker::Number.between(from: 1, to: 10) }
    start_mileage { Faker::Number.number(digits: 5) }
    final_mileage { Faker::Number.number(digits: 5) }
    employee
  end
end