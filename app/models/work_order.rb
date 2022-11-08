# This class represent a task
class WorkOrder < ApplicationRecord
  belongs_to :employee, optional: true
  belongs_to :car
  has_paper_trail

  validates :status, presence: true

  validates :start_mileage, presence: true, if: :finished?
  validates :final_mileage, presence: true, if: :finished?
  validates :final_oil, presence: true, if: :finished?
  validates :employee, presence: true, if: :finished?

  # Validate that a car has only work orders in a time period
  validates :start_date, collision_date: true
  validates :final_date, collision_date: true

  # Validations date
  validates_comparison_of :start_date, less_than: :final_date
  validates_comparison_of :final_date, greater_than: :start_date

  enum status: { requested: 0, authorized: 1, finished: 2 }, _default: 0

  delegate :plate_number, to: :car, prefix: true
  delegate :full_name, to: :employee, prefix: true, allow_nil: true

  def distance
    self.final_mileage ||= 0
    self.start_mileage ||= 0
    self.final_mileage - self.start_mileage
  end

  def requested_by
    user_id = versions.where_object_changes(status: :requested).first.try(:whodunnit)
    User.find_by(id: user_id)
  end

  def requested_on
    versions.where_object_changes(status: :requested).first.try(:created_at)
  end

  def authorized_by
    user_id = versions.where_object_changes(status: :authorized).last.try(:whodunnit)
    User.find_by(id: user_id)
  end

  def authorized_on
    versions.where_object_changes(status: :authorized).last.try(:created_at)
  end

  def finished_by
    user_id = versions.where_object_changes(status: :finished).last.try(:whodunnit)
    User.find_by(id: user_id)
  end

  def finished_on
    versions.where_object_changes(status: :finished).last.try(:created_at)
  end

  def to_s
    "#{self.class.model_name.human} ##{number}"
  end
end
