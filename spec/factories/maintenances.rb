FactoryBot.define do
  factory :maintenance do
    date { "2022-10-13" }
    mechanical_workshop { nil }
    budget { 1 }
    car { nil }
    description { "MyString" }
  end
end
