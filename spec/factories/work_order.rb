FactoryBot.define do
  factory :work_order do
    start_date { Faker::Date.between(from: 6.months.ago, to: Date.today) }
    final_date { Faker::Date.between(from: 6.months.since, to: Date.today) }
    status { Faker::Number.between(from: 0, to: 2) }
    area { 'Transporte' }
    number { Faker::Number.number(digits: 5) }
    description { Faker::Lorem.sentence }
    city { Faker::Lorem.sentence }
    start_mileage { Faker::Number.between(from: 1, to: 99999) }
    final_mileage { Faker::Number.between(from: 1, to: 99999) }
    final_oil { Faker::Number.between(from: 1, to: 99999) }
    employee
    car
  end
end