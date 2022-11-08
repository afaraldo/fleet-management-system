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
        create(:work_order)
      end
    end
    context 'should return who created register' do
      it { expect(subject.requested_by).to eq(user) }
    end
  end

  describe '.requested_on' do
    subject do
      PaperTrail.request(whodunnit: user.id) do
        create(:work_order)
      end
    end
    context 'should return time of creation register' do
      it { expect(subject.requested_on).to eq(subject.created_at) }
    end
  end

  describe '.requested_on' do
    subject do
      PaperTrail.request(whodunnit: user.id) do
        create(:work_order)
      end
    end
    context 'should return time of creation register' do
      it { expect(subject.requested_on).to eq(subject.created_at) }
    end
  end

  describe '.authorized_by' do
    context 'should return who update status of the register from requested to authorized' do
      let(:work_order) { create(:work_order) }
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
      let(:work_order) { create(:work_order) }
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
      let(:work_order) { create(:work_order) }
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
      let(:work_order) { create(:work_order) }
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
