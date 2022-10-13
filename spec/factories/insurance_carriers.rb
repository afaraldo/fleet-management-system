FactoryBot.define do
  factory :insurance_carrier, parent: :supplier do
    name { "MyString" }
    ruc { "MyString" }
    type { "InsuranceCarrier" }
  end
end
