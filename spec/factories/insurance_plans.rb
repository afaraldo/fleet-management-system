FactoryBot.define do
  factory :insurance_plan do
    contract_date { "2022-10-28" }
    car { nil }
    amount { 1 }
    exp_date { "2022-10-28" }
  end
end
