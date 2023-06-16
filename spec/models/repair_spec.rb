require 'rails_helper'

RSpec.describe Repair, type: :model do
  it { should validate_presence_of(:date) }
end
