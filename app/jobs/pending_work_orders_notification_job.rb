# Class
class PendingWorkOrdersNotificationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    logger.debug { "[PendingWorkOrdersNotificationJob] args: #{args.inspect}" }
    users_to_notify = User.administrative_only.notifications_activated
    work_orders = WorkOrder.pending_work_orders_for_the_week

    PendingWorkOrdersNotification
      .with(work_order_ids: work_orders.map(&:id),
            message: "Hay #{work_orders.size} nuevas Órdenes de Trabajo.")
      .deliver(users_to_notify)
  end
end
