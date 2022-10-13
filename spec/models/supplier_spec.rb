require 'rails_helper'

RSpec.describe Supplier do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:ruc) }
  end
end
