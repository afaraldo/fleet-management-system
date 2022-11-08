require 'rails_helper'

RSpec.describe ApplicationRecord, type: :model do

  describe '.text' do
    # As car inherits from ApplicationRecord
    subject { create(:car, {make: 'Hello', model: 'World', plate_number: 101}) }
    context 'should return a String with the value of to_s"' do
      it { expect(subject.text).to  eq(subject.to_s) }
    end
  end
end
