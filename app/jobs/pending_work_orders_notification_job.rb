# Class
class PendingWorkOrdersNotificationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    logger.debug { "[PendingWorkOrdersNotificationJob] args: #{args.inspect}" }
    users_to_notify = User.administrative_only
    PendingWorkOrdersNotification.deliver(users_to_notify)
  end
end
