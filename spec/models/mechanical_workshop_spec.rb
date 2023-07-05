# == Schema Information
#
# Table name: suppliers
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  ruc        :string           not null
#  type       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe MechanicalWorkshop, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:ruc) }
  it { should validate_presence_of(:type) }

  describe '.to_s' do
    subject { create(:mechanical_workshop, { name: "JuanK" }) }
    context 'should return a String with format "#{name}"' do
      it { expect(subject.to_s).to  eq("JuanK") }
    end
  end
end
