class WorkOrder < ApplicationRecord

  def distance
    final_mileage ||= 0
    start_mileage ||= 0
    final_mileage - start_mileage
  end
  def to_s
    number
  end
end
