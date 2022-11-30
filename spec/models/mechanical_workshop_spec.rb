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
