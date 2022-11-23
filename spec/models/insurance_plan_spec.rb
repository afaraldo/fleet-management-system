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
