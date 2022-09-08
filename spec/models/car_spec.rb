require 'rails_helper'

RSpec.describe Car, type: :model do
  # TODO add associtions
  # describe 'associations' do
  #   it { should belong_to(:category).class_name('MenuCategory') }
  # end

  describe 'validations' do
    it { should validate_presence_of(:make) }
    it { should validate_presence_of(:model) }
    it { should validate_presence_of(:color) }
    it { should validate_presence_of(:plate_number) }
    it { should validate_presence_of(:chassis) }
    it { should validate_presence_of(:engine) }

    it { should validate_uniqueness_of(:plate_number) }
  end
end
