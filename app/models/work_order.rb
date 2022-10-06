# This class represent a task
class WorkOrder < ApplicationRecord
  belongs_to :employee

  def distance
    final_mileage ||= 0
    start_mileage ||= 0
    final_mileage - start_mileage
  end

  def to_s
    number
  end
end
