# == Schema Information
#
# Table name: repairs
#
#  id                     :bigint           not null, primary key
#  date                   :date             not null
#  discarded_at           :datetime
#  repairs                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  car_id                 :bigint           not null
#  mechanical_workshop_id :bigint           not null
#
# Indexes
#
#  index_repairs_on_car_id                  (car_id)
#  index_repairs_on_discarded_at            (discarded_at)
#  index_repairs_on_mechanical_workshop_id  (mechanical_workshop_id)
#
# Foreign Keys
#
#  fk_rails_...  (car_id => cars.id)
#
class Repair < ApplicationRecord
  belongs_to :car
  belongs_to :mechanical_workshop
  delegate :name, to: :mechanical_workshop, prefix: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[car_id created_at date mechanical_workshop_id updated_at]
  end
end
