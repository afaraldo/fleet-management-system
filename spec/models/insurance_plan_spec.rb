require 'rails_helper'

RSpec.describe InsurancePlan, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:contract_date) }
    it { should validate_presence_of(:amount) }
    it { should has_and_belongs_to_many(:car) }
  end
end
