# == Schema Information
#
# Table name: work_orders
#
#  id            :bigint           not null, primary key
#  area          :string           not null
#  city          :string
#  description   :string           not null
#  final_date    :datetime         not null
#  final_mileage :integer
#  final_oil     :integer
#  integer       :string
#  number        :bigint           not null
#  start_date    :datetime         not null
#  start_mileage :integer
#  status        :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  car_id        :bigint
#  employee_id   :bigint
#
# Indexes
#
#  index_work_orders_on_car_id       (car_id)
#  index_work_orders_on_city         (city)
#  index_work_orders_on_description  (description)
#  index_work_orders_on_employee_id  (employee_id)
#  index_work_orders_on_final_date   (final_date)
#  index_work_orders_on_number       (number) UNIQUE
#  index_work_orders_on_start_date   (start_date)
#  index_work_orders_on_status       (status)
#
# Foreign Keys
#
#  fk_rails_...  (car_id => cars.id)
#  fk_rails_...  (employee_id => employees.id)
#
require 'rails_helper'

RSpec.describe WorkOrder, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:final_date) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:start_date) }
    it { should belong_to(:car) }
  end

  describe 'uniqueness' do
    subject { create(:work_order) }
    it { should validate_uniqueness_of(:number) }
  end

  describe 'db indexes' do
    it { should have_db_index(:number) }
    it { should have_db_index(:start_date) }
    it { should have_db_index(:final_date) }
    it { should have_db_index(:status) }
    it { should have_db_index(:car_id) }
    it { should have_db_index(:employee_id) }
  end

  let(:user) { create(:user) }

  describe '.requested_by' do
    subject do
      PaperTrail.request(whodunnit: user.id) do
        create(:work_order, status: :requested)
      end
    end
    context 'should return who created register' do
      it { expect(subject.requested_by).to eq(user) }
    end
  end

  describe '.requested_on' do
    subject do
      PaperTrail.request(whodunnit: user.id) do
        create(:work_order, status: :requested)
      end
    end
    context 'should return time of creation register' do
      it { expect(subject.requested_on).to eq(subject.created_at) }
    end
  end

  describe '.requested_on' do
    subject do
      PaperTrail.request(whodunnit: user.id) do
        create(:work_order, status: :requested)
      end
    end
    context 'should return time of creation register' do
      it { expect(subject.requested_on).to eq(subject.created_at) }
    end
  end

  describe '.authorized_by' do
    context 'should return who update status of the register from requested to authorized' do
      let(:work_order) { create(:work_order, status: :requested) }
      it {
        PaperTrail.request(whodunnit: user.id) do
          work_order.update!(status: :authorized)
        end
        expect(work_order.authorized_by).to eq(user)
      }
    end
  end

  describe '.authorized_on' do
    context 'should return time when update status from requested to authorized in the register' do
      let(:work_order) { create(:work_order, status: :requested) }
      it {
        PaperTrail.request(whodunnit: user.id) do
          work_order.update!(status: :authorized)
        end
        expect(work_order.authorized_on).to eq(work_order.updated_at)
      }
    end
  end

  describe '.authorized_by' do
    context 'should return who update status of the register from authorized to finished' do
      let(:work_order) { create(:work_order, status: :requested) }
      it {
        PaperTrail.request(whodunnit: user.id) do
          work_order.update(status: :authorized)
          work_order.update!(status: :finished, final_oil: 2, start_mileage: 1, final_mileage: 2)
        end
        expect(work_order.finished_by).to eq(user)
      }
    end
  end

  describe '.authorized_by' do
    context 'should return time when update status of the register from authorized to finished' do
      let(:work_order) { create(:work_order, status: :requested) }
      it {
        PaperTrail.request(whodunnit: user.id) do
          work_order.update(status: :authorized)
          work_order.update!(status: :finished, final_oil: 2, start_mileage: 1, final_mileage: 2)
        end
        expect(work_order.finished_on).to eq(work_order.updated_at)
      }
    end
  end

  describe '.distance' do
    let(:start_mileage){ rand(1..10) }
    let(:final_mileage){ rand(50..100) }
    subject { create(:work_order, { start_mileage: start_mileage, final_mileage: final_mileage}) }
    context 'should return a Number equal to the difference between start_mileage and final_mileage' do
      it { expect(subject.distance).to eq(final_mileage - start_mileage) }
    end
  end

  describe '.workdays' do
    let(:start_date){ Time.find_zone('Santiago').parse('2022-11-12 2pm') }
    let(:final_date){ Time.find_zone('Santiago').parse('2022-11-14 2pm') }
    subject { create(:work_order, { start_date: start_date, final_date: final_date}) }
    context 'should return a Number equal to the difference between start_date and final_date' do
      it { expect(subject.workdays).to eq((final_date.to_date - start_date.to_date).to_i) }
    end
  end

  describe '.to_s' do
    subject { create(:work_order, { number: 101}) }
    context 'should return a String with format "#{class_name.human} #{number}"' do
      it { expect(subject.to_s).to  eq("Orden de Trabajo #101") }
    end
  end

  describe ".create" do
    let!(:car){ create(:car) }
    let!(:work_order){ create(:work_order, start_date: "2022-11-02 00:00", final_date: "2022-11-06 23:59", car: car) }
    context 'when start_date within another work_order' do
      it "should return a invalid record" do
        expect(build(:work_order, start_date: "2022-11-04 00:00", final_date: "2022-11-07 23:59", car: car)).not_to be_valid
      end
    end

    context 'when final_date within another work_order' do
      it "should return a invalid record" do
        expect(build(:work_order, start_date: "2022-11-01 00:00", final_date: "2022-11-03 23:59", car: car)).not_to be_valid
      end
    end

    context 'when start_date and final_date within another work_order' do
      it "should return a invalid record" do
        expect(build(:work_order, start_date: "2022-11-03 00:00", final_date: "2022-11-04 23:59", car: car)).not_to be_valid
      end
    end

    context 'when start_date and final_date contains another work_order' do
      it "should return a invalid record" do
        expect(build(:work_order, start_date: "2022-11-01 00:00", final_date: "2022-11-07 23:59", car: car)).not_to be_valid
      end
    end
  end
end
