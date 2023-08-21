class InsurancePlansToExpireJob < ApplicationJob
  queue_as :default

  def perform(*args)
    logger.debug { "[InsurancePlansToExpireJob] args: #{args.inspect}" }
    users_to_notify = User.administrative_only
    InsurancePlansToExpireNotification.deliver(users_to_notify)
  end
end
