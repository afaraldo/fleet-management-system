FactoryBot.define do
  factory :work_order do
    start_date { Faker::Date.between(from: 6.months.ago, to: Date.today) }
    final_date { Faker::Date.between(from: 6.months.since, to: Date.today) }
    status { 0 }
    number { Faker::Number.number(digits: 5) }
    description { Faker::Lorem.sentence }
    city { Faker::Lorem.sentence }
    workdays { Faker::Number.between(from: 1, to: 10) }
    start_mileage { Faker::Number.number(digits: 5) }
    final_mileage { Faker::Number.number(digits: 5) }
    employee
    car
  end
end