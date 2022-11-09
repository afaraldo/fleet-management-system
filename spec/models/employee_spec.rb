require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'associations' do
    it { should have_many(:work_orders) }
  end

  describe '.to_s' do
    subject { create(:employee) }
    context 'should return a String composed of name and last_name' do
      it { expect(subject.full_name).to  eq("#{subject.name} #{subject.last_name}") }
    end
  end
end
