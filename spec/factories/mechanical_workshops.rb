FactoryBot.define do
  factory :mechanical_workshop , parent: :supplier do
    name { Faker::Name.name }
    ruc { Faker::IDNumber.valid }
    type { "MechanicalWorkshop" }
  end
end
