FactoryBot.define do
  factory :insurance_carrier, parent: :supplier do
    name { Faker::Name.name }
    ruc { Faker::IDNumber.valid }
    type { "InsuranceCarrier" }
  end
end
