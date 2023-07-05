# == Schema Information
#
# Table name: maintenances
#
#  id                     :bigint           not null, primary key
#  budget                 :integer
#  date                   :date             not null
#  description            :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  car_id                 :bigint           not null
#  mechanical_workshop_id :bigint           not null
#
# Indexes
#
#  index_maintenances_on_car_id                  (car_id)
#  index_maintenances_on_mechanical_workshop_id  (mechanical_workshop_id)
#
# Foreign Keys
#
#  fk_rails_...  (car_id => cars.id)
#  fk_rails_...  (mechanical_workshop_id => suppliers.id)
#
FactoryBot.define do
  factory :maintenance do
    date { Faker::Date.between(from: 6.months.ago, to: Date.today) }
    budget { Faker::Number.number(digits: 5) }
    description { Faker::Lorem.sentence }
    car
    mechanical_workshop
  end
end
