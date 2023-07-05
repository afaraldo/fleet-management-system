# == Schema Information
#
# Table name: employees
#
#  id         :bigint           not null, primary key
#  address    :string
#  document   :string
#  last_name  :string
#  name       :string
#  phone      :string
#  position   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :employee do
    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    document { Faker::IDNumber.valid }
    address { Faker::Lorem.sentence }
    phone { Faker::PhoneNumber.cell_phone }
  end
end
