source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 7.0.5'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# This line is required for dependabot security alerts [CVE-2022-32224]
gem 'activerecord', '>= 7.0.3.1'

# Used to breadcrumbs [https://github.com/fnando/breadcrumbs]
gem 'breadcrumbs_on_rails'

# Use controller_resources to get DRY controller [https://github.com/tubbo/controller_re  sources]
gem 'controller_resources'

# This line is required for dependabot security alerts [CVE-2022-32209]
gem 'rails-html-sanitizer', '>= 1.4.4'

# This gem is used for build form more easily [https://github.com/heartcombo/simple_form]
gem 'simple_form'
# This gem is used for build search form with ransack [https://github.com/kaspernj/simple_form_ransack]
gem 'simple_form_ransack'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.6.7'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem 'kredis'

# Use Kaminari to get pagination
gem 'kaminari'

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem 'bcrypt', '~> 3.1.7'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Ransack to get filters in Controller [https://github.com/activerecord-hackery/ransack]
gem 'ransack'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'

# Use to dry validation between database and model [https://github.com/SchemaPlus/schema_validations]
# gem 'schema_validations'

# Use to build navbar [https://github.com/codeplant/simple-navigation]
gem 'simple-navigation'

# Use to System Setting [https://github.com/krists/system_settings]
gem 'system_settings'

# Use to show alerts [https://github.com/joshmn/turbo_flash]
gem 'turbo_flash'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem 'image_processing', '~> 1.2'

# Use Assets CSS & JS [https://github.com/rails/cssbundling-rails]
gem 'cssbundling-rails', '~> 1.1' # needed for bootstrap css

# Use Assets CSS & JS [https://github.com/rails/jsbundling-rails]
gem 'jsbundling-rails' # needed for bootstrap javascript

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  # Use to debbuging [https://github.com/BetterErrors/better_errors]
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'brakeman', '~> 5.2.3'
  gem 'bundler-audit', '~> 0.9.1'
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 6.0.0.rc1'
  gem 'rubocop', '~> 1.31', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'rubocop-thread_safety', require: false
  gem 'rubycritic', require: false
  gem 'ruby-debug-ide', require: false
  gem 'shoulda-matchers', '~> 5.0'
  gem 'simplecov', require: false
  gem 'solargraph', require: false
end

# Flexible authentication solution for Rails with Warden. Read more: http://blog.plataformatec.com.br/tag/devise/
gem 'devise'

# An enterprise security extension for devise, trying to meet industrial standard security demands for web applications.
# gem 'devise_security_extension'

# Translations for the devise gem
gem 'devise-i18n'

# I18n support for devise views
gem 'devise-i18n-views'

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem 'rack-mini-profiler'

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem 'spring'
end
# DON'T REMOVE BECAUSE TESTS SHOULD FAIL
gem 'sassc-rails', group: :test

gem 'factory_bot_rails' # https://github.com/thoughtbot/factory_bot_rails
gem 'faker' # https://github.com/faker-ruby/faker

# Used to integration between ActiveRecord Enum and simple_form [https://github.com/zmbacker/enum_help]
gem 'enum_help'
# Parser XML/JSON [https://github.com/sparklemotion/nokogiri]
gem 'nokogiri'
# Used to add version to objects [https://github.com/paper-trail-gem/paper_trail]
gem 'paper_trail', '~> 13.0'
# Used to add app version [https://github.com/mort666/app_version]
gem 'app_version', git: 'https://github.com/afaraldo/app_version.git', branch: 'master'
# Access-granted [https://github.com/chaps-io/access-granted]
gem 'access-granted', '~> 1.0.0'

# Used to add service layer [https://github.com/collectiveidea/interactor-rails]
gem 'interactor-rails', '~> 2.0'
# Used to export spreadsheet [https://github.com/caxlsx/caxlsx_rails]
gem 'caxlsx'
gem 'caxlsx_rails'

# Used to add notification [https://github.com/excid3/noticed]

# Used to improve performance using second level cache [https://github.com/hooopo/second_level_cache]
# gem 'second_level_cache', '~> 2.7'

# Used to add notification [https://github.com/excid3/noticed]
gem 'noticed', '~> 1.6'

# Used to processing images [https://github.com/janko/image_processing]
gem 'image_processing', '>= 1.2'

# Used as backend and background jobs
gem 'audited-activejob' # [https://github.com/markrebec/audited-activejob]
gem 'good_job', '~> 3.15' # [https://github.com/bensheldon/good_job]

# Used to reporting [https://github.com/ankane/blazer]
gem 'blazer'

# Used to build view components [https://github.com/viewcomponent/view_component]
gem 'view_component'

# Add docs to models [https://github.com/ctran/annotate_models]
gem 'annotate', '~> 3.2'

gem 'chroma' # [https://github.com/jfairbank/chroma]

gem 'actionpack', '>= 7.0.5.1'
gem 'activerecord-multi-tenant' # [https://github.com/citusdata/activerecord-multi-tenant]
gem 'activesupport', '>= 7.0.7.1'
gem 'algoliasearch-rails' # [https://github.com/algolia/algoliasearch-rails]
gem 'aws-sdk-s3'
gem 'discard', '~> 1.2' # [https://github.com/jhawthorn/discard]
gem 'groupdate' # [https://github.com/ankane/groupdate]
gem 'sentry-rails' # [https://github.com/getsentry/sentry-ruby]
gem 'sentry-ruby' # [https://github.com/getsentry/sentry-ruby]
gem 'stackprof' # [https://github.com/getsentry/sentry-ruby]
