module Notifications
  # This is a job running to sidekiq
  class InsurancePlanExpirationJob
    include Sidekiq::Job

    def perform(*args)
      # Do something
    end
  end
end
