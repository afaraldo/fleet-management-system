# This method validates that there are not two work orders overlapping in time,
# that is, that the start and end days of any work order are contained in the start and end days of another.
# Only work orders with the same car are considered
class CollisionDateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, _value)
    intersecting_work_orders = WorkOrder.where('? BETWEEN ? AND ?', attribute, record.start_date, record.final_date)
                                        .where(car_id: record.car_id)
                                        .excluding(record)

    return unless intersecting_work_orders.any?

    errors.add attribute, (options[:message] || :busy_date), record: intersecting_work_orders.first.to_s
  end
end
