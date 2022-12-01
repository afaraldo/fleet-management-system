FactoryBot.define do
  factory :user do
    email { Faker::Internet.email  }
    password { Faker::Internet.password }
    avatar { nil }
  end
end
