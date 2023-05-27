module Notifications
  # This is a job running to sidekiq
  class InsurancePlanExpirationJob
    include Sidekiq::Job

    # args should be a hash likes {period: day} or {period: week} or {period: month}
    # args = [{"period":"week"}]
    def perform(args)
      logger.debug { "My args: #{args.inspect}" }
      users_to_notify = User.where.not(role: 3) # All excludes :driver
      plans_to_beat = InsurancePlan.where('expiry_date BETWEEN ? AND ?', Time.zone.today, 1.send(args).since)

      logger.debug { 'There are no plans to expire' } if plans_to_beat.empty?
      plans_to_beat.each do |plan|
        message = "El contrato de seguro Nro #{plan.id} vence el #{plan.expiry_date}"
        EventNotification.with(message:).deliver(users_to_notify)
      end
    end
  end
end
