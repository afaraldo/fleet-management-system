# == Schema Information
#
# Table name: cars
#
#  id                  :bigint           not null, primary key
#  assigned_dependency :string
#  chassis             :string
#  color               :string
#  discarded_at        :datetime
#  horometro           :boolean          default(FALSE), not null
#  make                :string
#  model               :string
#  plate_number        :string
#  rasp                :string
#  type_car            :string           not null
#  year                :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  organization_id     :bigint
#
# Indexes
#
#  index_cars_on_discarded_at                      (discarded_at)
#  index_cars_on_organization_id                   (organization_id)
#  index_cars_on_plate_number                      (plate_number)
#  index_cars_on_plate_number_and_organization_id  (plate_number,organization_id) UNIQUE
#  index_cars_on_rasp                              (rasp)
#
require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'associations' do
    it { should have_many(:work_orders) }
    it { should have_and_belong_to_many(:insurance_plans) }
  end

  describe 'validations' do
    it { should validate_presence_of(:type_car) }
    it { should validate_presence_of(:make) }
    it { should validate_presence_of(:type_car) }
    it { should validate_presence_of(:plate_number) }
  end

  describe '.to_s' do
    subject { create(:car, {type_car: 'Hello', make: 'Hello', model: 'World', plate_number: 101}) }
    context 'should return a String with format "#{type_car} #{make} #{model} #{plate_number}"' do
      it { expect(subject.to_s).to  eq("Hello Hello World 101") }
    end
  end
end
