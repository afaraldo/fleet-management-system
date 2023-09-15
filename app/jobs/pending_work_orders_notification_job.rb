# Class
class PendingWorkOrdersNotificationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    logger.debug { "[PendingWorkOrdersNotificationJob] args: #{args.inspect}" }
    users_to_notify = User.administrative_only
    work_orders = WorkOrder.pending_work_orders_for_the_week

    PendingWorkOrdersNotification.with(work_order_ids: work_orders.map(&:id)).deliver(users_to_notify)
  end
end
