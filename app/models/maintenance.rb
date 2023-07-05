# == Schema Information
#
# Table name: maintenances
#
#  id                     :bigint           not null, primary key
#  budget                 :integer
#  date                   :date             not null
#  description            :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  car_id                 :bigint           not null
#  mechanical_workshop_id :bigint           not null
#
# Indexes
#
#  index_maintenances_on_car_id                  (car_id)
#  index_maintenances_on_mechanical_workshop_id  (mechanical_workshop_id)
#
# Foreign Keys
#
#  fk_rails_...  (car_id => cars.id)
#  fk_rails_...  (mechanical_workshop_id => suppliers.id)
#
# This class represents a Maintenance
class Maintenance < ApplicationRecord
  belongs_to :mechanical_workshop
  belongs_to :car
  delegate :name, to: :mechanical_workshop, prefix: true

  def to_s
    "#{self.class.model_name.human} Nro: #{id}"
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[budget car_id created_at date description id mechanical_workshop_id updated_at]
  end
end
