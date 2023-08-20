# == Schema Information
#
# Table name: suppliers
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  ruc        :string           not null
#  type       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :mechanical_workshop do
    name { Faker::Name.name }
    ruc { Faker::IDNumber.valid }
    type { "MechanicalWorkshop" }
  end
end
