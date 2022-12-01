FactoryBot.define do
  factory :notification do
    recipient { nil }
    type { "" }
    params { "" }
    read_at { "2022-12-01 09:09:00" }
  end
end
