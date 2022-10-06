FactoryBot.define do
  factory :employee do
    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    document { Faker::IDNumber.valid }
    address { Faker::Lorem.sentence }
    phone { Faker::PhoneNumber.cell_phone }
  end
end