require 'rails_helper'

RSpec.describe InsurancePlan, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:contract_date) }
    it { should validate_presence_of(:amount) }
  end

  describe '.to_s' do
    subject { create(:insurance_plan) }
    context 'should return a String composed of insurance carrier' do
      it { expect(subject.to_s).to  eq("#{subject.insurance_carrier.name}") }
    end
  end
end
