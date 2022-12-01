FactoryBot.define do
  factory :user do
    email { Faker::Internet.email  }
    password { "HolaMundo123" }
    password_confirmation { "HolaMundo123" }
    avatar { nil }
  end
end
