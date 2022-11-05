FactoryBot.define do
  factory :insurance_plan do
    contract_date { Faker::Date.between(from: 6.months.ago, to: Date.today) }
    amount { Faker::Number.number(digits: 5)}
    exp_date { Faker::Date.between(from: 6.months.ago, to: Date.today)  }
    car
  end
end
