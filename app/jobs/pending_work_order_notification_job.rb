# Class
class PendingWorkOrderNotificationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    logger.debug { "[PendingWorkOrderNotificationJob] args: #{args.inspect}" }
    users_to_notify = User.administrative_only
    work_orders = WorkOrder.all

    work_orders.each do |work_order|
      message = "Nueva Orden de Trabajo Nro #{work_order.number}"
      EventNotification.with(message:).deliver(users_to_notify)
    end
  end
end
