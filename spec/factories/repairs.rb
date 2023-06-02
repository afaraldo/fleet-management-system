FactoryBot.define do
  factory :repair do
    date { "2023-05-31" }
    car { nil }
    mechanical_workshop { nil }
    repairs { "MyString" }
  end
end
