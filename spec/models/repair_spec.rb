require 'rails_helper'

RSpec.describe Repair, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:date) }
  end
end