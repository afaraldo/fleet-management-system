# == Schema Information
#
# Table name: work_orders
#
#  id              :bigint           not null, primary key
#  area            :string           not null
#  city            :string
#  cost            :integer          default(0), not null
#  description     :string           not null
#  discarded_at    :datetime
#  final_date      :datetime         not null
#  final_mileage   :integer
#  final_oil       :integer
#  integer         :string
#  number          :bigint           not null
#  start_date      :datetime         not null
#  start_mileage   :integer
#  status          :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  car_id          :bigint
#  employee_id     :bigint
#  organization_id :bigint
#
# Indexes
#
#  index_work_orders_on_car_id           (car_id)
#  index_work_orders_on_city             (city)
#  index_work_orders_on_description      (description)
#  index_work_orders_on_discarded_at     (discarded_at)
#  index_work_orders_on_employee_id      (employee_id)
#  index_work_orders_on_final_date       (final_date)
#  index_work_orders_on_number           (number)
#  index_work_orders_on_organization_id  (organization_id)
#  index_work_orders_on_start_date       (start_date)
#  index_work_orders_on_status           (status)
#
# Foreign Keys
#
#  fk_rails_...  (car_id => cars.id)
#  fk_rails_...  (employee_id => employees.id)
#
FactoryBot.define do
  factory :work_order do
    start_date { Faker::Date.between(from: 6.months.ago, to: Date.today) }
    final_date { Faker::Date.between(from: 6.months.since, to: Date.today) }
    status { Faker::Number.between(from: 0, to: 2) }
    area { 'Transporte' }
    number { Faker::Number.number(digits: 5) }
    description { Faker::Lorem.sentence }
    city { Faker::Lorem.sentence }
    start_mileage { Faker::Number.between(from: 1, to: 99999) }
    final_mileage { Faker::Number.between(from: 1, to: 99999) }
    final_oil { Faker::Number.between(from: 1, to: 99999) }
    employee
    car
  end
end
