class InsurancePlansToExpireJob < ApplicationJob
  queue_as :default

  def perform(*args)
    logger.debug { "[InsurancePlansToExpireJob] args: #{args.inspect}" }
    users_to_notify = User.administrative_only
    insurance_plans_close_to_expire = InsurancePlan.close_to_expire

    InsurancePlansToExpireNotification.with(insurance_plans_close_to_expire_ids: insurance_plans_close_to_expire.map(&:id)).deliver(users_to_notify)
  end
end
