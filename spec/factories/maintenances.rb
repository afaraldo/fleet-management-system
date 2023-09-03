# == Schema Information
#
# Table name: maintenances
#
#  id                     :bigint           not null, primary key
#  current_mileage        :integer
#  date                   :date             not null
#  description            :string
#  discarded_at           :datetime
#  next_mileage           :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  car_id                 :bigint           not null
#  mechanical_workshop_id :bigint           not null
#
# Indexes
#
#  index_maintenances_on_car_id                  (car_id)
#  index_maintenances_on_discarded_at            (discarded_at)
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
    current_mileage { Faker::Number.between(from: 1, to: 99999) }
    next_mileage { Faker::Number.between(from: 1, to: 99999) }
    description { Faker::Lorem.sentence }
    car
    mechanical_workshop
  end
end
