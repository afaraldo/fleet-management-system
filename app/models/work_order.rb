# This class represent a task
class WorkOrder < ApplicationRecord
  belongs_to :employee, optional: true
  belongs_to :car
  has_paper_trail

  enum status: { requested: 0, authorized: 1, finished: 2 }

  validates_presence_of :car
  delegate :plate_number, to: :car, prefix: true

  def distance
    final_mileage ||= 0
    start_mileage ||= 0
    final_mileage - start_mileage
  end

  def requested_by
    versions.first.whodunnit
  end

  def requested_on
    versions.first.created_at
  end

  def authorized_by
    versions.where_object_changes(status: :authorized).last.try(:whodunnit) || 'pending'
  end

  def authorized_on
    versions.where_object_changes(status: :authorized).last.try(:created_at)
  end

  def finished_by
    versions.where_object_changes(status: :finished).last.try(:whodunnit) || 'pending'
  end

  def finished_on
    versions.where_object_changes(status: :finished).last.try(:created_at)
  end

  def to_s
    "Order ##{number}"
  end
end
