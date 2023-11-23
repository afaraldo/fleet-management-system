# == Schema Information
#
# Table name: employees
#
#  id              :bigint           not null, primary key
#  address         :string
#  discarded_at    :datetime
#  document        :string
#  last_name       :string
#  name            :string
#  phone           :string
#  position        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint
#
# Indexes
#
#  index_employees_on_discarded_at     (discarded_at)
#  index_employees_on_document         (document)
#  index_employees_on_organization_id  (organization_id)
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
