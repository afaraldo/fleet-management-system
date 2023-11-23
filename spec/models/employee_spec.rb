# == Schema Information
#
# Table name: employees
#
#  id              :bigint           not null, primary key
#  address         :string
#  discarded_at    :datetime
#  document        :string
#  last_name       :string
#  name            :string
#  phone           :string
#  position        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint
#
# Indexes
#
#  index_employees_on_discarded_at     (discarded_at)
#  index_employees_on_document         (document)
#  index_employees_on_organization_id  (organization_id)
#
require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'associations' do
    it { should have_many(:work_orders) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:document) }
  end

  describe '.to_s' do
    subject { create(:employee) }
    context 'should return a String composed of name and last_name' do
      it { expect(subject.to_s).to  eq("#{subject.name} #{subject.last_name}") }
    end
  end
end
