require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'associations' do
    it { should have_many(:work_orders) }
  end

  describe 'validations' do
    it { should validate_presence_of(:make) }
    it { should validate_presence_of(:model) }
    it { should validate_presence_of(:plate_number) }
  end

  describe '.to_s' do
    subject { create(:car, {make: 'Hello', model: 'World', plate_number: 101}) }
    context 'should return a String with format "#{make} #{model} #{plate_number}"' do
      it { expect(subject.to_s).to  eq("Hello World 101") }
    end
  end
end
