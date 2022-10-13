require 'rails_helper'

RSpec.describe InsuranceCarrier do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:ruc) }
  it { should validate_presence_of(:type) }
end
