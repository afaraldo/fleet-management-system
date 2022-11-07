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
  validate :date_collision

  # Validations date
  validates_comparison_of :start_date, less_than: :final_date
  validates_comparison_of :final_date, greater_than: :start_date

  enum status: { draft: 0, requested: 1, authorized: 2, finished: 3 }, _default: :requested

  delegate :plate_number, to: :car, prefix: true

  def workdays
    final_date - start_date
  end

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
    "#{self.class.model_name.human} ##{number}"
  end

  private

  # This method validates that there are not two work orders overlapping in time, that is, that the start and end days of any work order are contained in the start and end days of another.
  # Only work orders with the same car are considered
  def date_collision
    invalid_start_date = WorkOrder.where('start_date BETWEEN ? AND ?',
                             start_date, final_date)
                      .where(car_id: car_id)
                      .excluding(self)
    invalid_final_date = WorkOrder.where('final_date BETWEEN ? AND ?',
                                         start_date, final_date)
                                  .where(car_id: car_id)
                                  .excluding(self)

    errors.add(:start_date, :busy_date, record: invalid_start_date.first.to_s) if invalid_start_date.any?
    errors.add(:final_date, :busy_date, record: invalid_final_date.first.to_s) if invalid_final_date.any?
  end
end
