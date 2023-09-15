require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
# require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FleetManagementSystem
  # Default Rails class
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = 'Santiago'
    # config.eager_load_paths << Rails.root.join('app/navigation_renderers')

    # Don't generate system test files.
    config.generators.system_tests = nil

    # Configure background jobs
    config.active_job.queue_adapter = :good_job

    config.i18n.default_locale = :es
    config.i18n.load_path += SimpleFormRansack.locale_files # Using for https://github.com/kaspernj/simple_form_ransack
    config.autoload_paths += %W[#{config.root}/app/policies, #{config.root}/lib]

    config.good_job.enable_cron = true
    config.good_job.cron = {
      pending_work_order_notification_job: { # each recurring job must have a unique key
        cron: '*/5 * * * 1-5', # cron-style scheduling format by fugit gem
        class: 'PendingWorkOrdersNotificationJob', # name of the job class as a String; must reference an Active Job job class
        # args: [], # positional arguments to pass to the job; can also be a proc e.g. `-> { [Time.now] }`
        # kwargs: { name: "Alice" }, # keyword arguments to pass to the job; can also be a proc e.g. `-> { { name: NAMES.sample } }`
        # set: { priority: -10 }, # additional Active Job properties; can also be a lambda/proc e.g. `-> { { priority: [1,2].sample } }`
        description: 'Notification of pending WorkOrders', # optional description that appears in Dashboard
      },
      insurance_plans_to_expire_job: { # each recurring job must have a unique key
                                             cron: '*/6 * * * 1-5', # cron-style scheduling format by fugit gem
                                             class: 'InsurancePlansToExpireJob', # name of the job class as a String; must reference an Active Job job class
                                             # args: [], # positional arguments to pass to the job; can also be a proc e.g. `-> { [Time.now] }`
                                             # kwargs: { name: "Alice" }, # keyword arguments to pass to the job; can also be a proc e.g. `-> { { name: NAMES.sample } }`
                                             # set: { priority: -10 }, # additional Active Job properties; can also be a lambda/proc e.g. `-> { { priority: [1,2].sample } }`
                                             description: 'Notification of InsurancePlans To Expire', # optional description that appears in Dashboard
      }
    }
  end
end
