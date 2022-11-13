# This class is used to show timeline
class GetCarEvents
  include Interactor

  def call
    car = Car.find(context.id)
    result = []
    car.work_orders
       .joins(:versions)
       .where("(object_changes->>'status' ILIKE '[\"finished\",%') OR
               (object_changes->>'status' ILIKE '[%,\"finished\"]%')")
       .find_each do |work_order|
         result << {
           title: work_order.number,
           date: work_order.finished_on,
           description: work_order.description,
           type: :work_order
         }
       end
    context.result = result
  end
end
