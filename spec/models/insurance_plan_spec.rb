require 'rails_helper'

RSpec.describe InsurancePlan, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:contract_date) }
    it { should validate_presence_of(:car) }
    it { should validate_presence_of(:amount) }
  end
end
