# This model represents a reapi
class Repair < ApplicationRecord
  belongs_to :car
  belongs_to :mechanical_workshop
  delegate :name, to: :mechanical_workshop, prefix: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[car_id created_at date mechanical_workshop_id updated_at]
  end
end
