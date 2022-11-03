# This class represent a task
class WorkOrder < ApplicationRecord
  belongs_to :employee, optional: true
  belongs_to :car
  has_paper_trail

  validates :start_mileage, presence: true, if: :finished?
  validates :final_mileage, presence: true, if: :finished?
  validates :final_oil, presence: true, if: :finished?
  validates :employee, presence: true, if: :finished?

  enum status: { requested: 0, authorized: 1, finished: 2 }

  delegate :plate_number, to: :car, prefix: true

  def distance
    self.final_mileage ||= 0
    self.start_mileage ||= 0
    self.final_mileage - self.start_mileage
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
    "#{self.class.model_name.human} #{number}"
  end
end
