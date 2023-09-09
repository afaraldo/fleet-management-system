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
require 'rails_helper'

RSpec.describe InsurancePlan, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:contract_date) }
    it { should validate_presence_of(:amount) }
    it { should have_and_belong_to_many(:cars) }
  end

  describe '.to_s' do
    subject { create(:insurance_plan, { id: 13 } ) }
    context 'should return a String with format "#{self.class.model_name.human} #{"Nro:"} #{id}"' do
      it { expect(subject.to_s).to eq("Seguro Nro: 13") }
    end
  end
end
