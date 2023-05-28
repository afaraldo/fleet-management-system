# This class is used to show timeline
class GetCarEvents
  include Interactor

  def call
    car = Car.find(context.id)
    result = []

    # WorkOrder Event
    car.work_orders
       .joins(:versions)
       .find_each do |work_order|
         result << {
           title: work_order.to_s,
           date: work_order.finished_on,
           description: work_order.description,
           type: :work_order
         }
       end

    # Maintenance Event
    car.maintenances
       .find_each do |maintenance|
         result << {
           title: maintenance.to_s,
           date: maintenance.date,
           description: maintenance.description,
           type: :maintenance
         }
       end

    # InsurancePlan Event
    car.insurance_plans
       .find_each do |insurance_plan|
      result << {
        title: insurance_plan.to_s,
        date: insurance_plan.contract_date,
        description: insurance_plan.amount,
        type: :insurance_plan
      }
    end

    context.result = result
  end
end
