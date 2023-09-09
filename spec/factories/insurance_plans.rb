# == Schema Information
#
# Table name: insurance_plans
#
#  id                   :bigint           not null, primary key
#  amount               :integer          not null
#  contract_date        :date             not null
#  discarded_at         :datetime
#  expiry_date          :date
#  type_coverage        :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  insurance_carrier_id :bigint
#
# Indexes
#
#  index_insurance_plans_on_discarded_at          (discarded_at)
#  index_insurance_plans_on_expiry_date           (expiry_date)
#  index_insurance_plans_on_insurance_carrier_id  (insurance_carrier_id)
#
# Foreign Keys
#
#  fk_rails_...  (insurance_carrier_id => suppliers.id)
#
FactoryBot.define do
  factory :insurance_plan do
    contract_date { Faker::Date.between(from: 6.months.ago, to: Date.today) }
    amount { Faker::Number.number(digits: 5)}
    expiry_date { Faker::Date.between(from: 6.months.ago, to: Date.today)  }
    cars { [association(:car)] }
    insurance_carrier { create(:insurance_carrier).becomes(InsuranceCarrier) }
  end
end
