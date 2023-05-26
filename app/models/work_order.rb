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

  # Validations date
  validates_comparison_of :start_date, less_than: :final_date
  validates_comparison_of :final_date, greater_than: :start_date

  enum status: { requested: 0, authorized: 1, finished: 2 }

  delegate :plate_number, to: :car, prefix: true
  delegate :full_name, to: :employee, prefix: true, allow_nil: true

  def distance
    self.final_mileage ||= 0
    self.start_mileage ||= 0
    self.final_mileage - self.start_mileage
  end

  def workdays
    (final_date.to_date - start_date.to_date).to_i
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

  validate :validate_start_date,
           :validate_final_date,
           :validate_start_date_and_final_date

  # From https://stackoverflow.com/questions/37257835/searching-on-an-enum-field-with-ransack
  ransacker :status, formatter: proc { |v| statuses[v] } do |parent|
    parent.table[:status]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[area car_id city created_at description employee_id final_date final_mileage final_oil id integer number
       start_date start_mileage status updated_at]
  end

  private

  def validate_start_date
    posterior_work_order = WorkOrder.where('start_date BETWEEN ? AND ?', start_date, final_date)
                                    .where(car_id:)
                                    .excluding(self)

    return unless posterior_work_order.any?

    errors.add :final_date, :busy_date, record: posterior_work_order.first.to_s
  end

  def validate_final_date
    previous_work_orders = WorkOrder.where('final_date BETWEEN ? AND ?', start_date, final_date)
                                    .where(car_id:)
                                    .excluding(self)

    return unless previous_work_orders.any?

    errors.add :start_date, :busy_date, record: previous_work_orders.first.to_s
  end

  def validate_start_date_and_final_date
    wo1 = WorkOrder.where('start_date <= ?', start_date).order(start_date: :desc).excluding(self).limit(1)
    wo2 = WorkOrder.where('final_date >= ?', final_date).order(final_date: :asc).excluding(self).limit(1)

    # if wo1 and wo2 are equal then wo1 contains to new work order record
    return unless wo1.any? && wo2.any? && wo1.first == wo2.first

    errors.add :start_date, :busy_date, record: wo1.first.to_s
    errors.add :final_date, :busy_date, record: wo2.first.to_s
  end
end
