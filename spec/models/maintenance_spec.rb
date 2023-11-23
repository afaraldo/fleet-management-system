# == Schema Information
#
# Table name: maintenances
#
#  id                     :bigint           not null, primary key
#  current_mileage        :integer
#  date                   :date             not null
#  description            :string
#  discarded_at           :datetime
#  next_mileage           :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  car_id                 :bigint           not null
#  mechanical_workshop_id :bigint           not null
#  organization_id        :bigint
#
# Indexes
#
#  index_maintenances_on_car_id                  (car_id)
#  index_maintenances_on_discarded_at            (discarded_at)
#  index_maintenances_on_mechanical_workshop_id  (mechanical_workshop_id)
#  index_maintenances_on_organization_id         (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (car_id => cars.id)
#  fk_rails_...  (mechanical_workshop_id => suppliers.id)
#
require 'rails_helper'

RSpec.describe Maintenance, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:date) }
  end
end
