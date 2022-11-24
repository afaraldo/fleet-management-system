FactoryBot.define do
  factory :insurance_plan do
    contract_date { Faker::Date.between(from: 6.months.ago, to: Date.today) }
    amount { Faker::Number.number(digits: 5)}
    expiry_date { Faker::Date.between(from: 6.months.ago, to: Date.today)  }
    cars { [association(:car)] }
    insurance_carrier { create(:insurance_carrier).becomes(InsuranceCarrier) }
  end
end
