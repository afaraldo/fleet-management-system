source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 7.0.3'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# This line is required for dependabot security alerts [CVE-2022-32224]
gem 'activerecord', '>= 7.0.3.1'

# Use controller_resources to get DRY controller [https://github.com/tubbo/controller_re  sources]
gem 'controller_resources'

# This line is required for dependabot security alerts [CVE-2022-32209]
gem 'rails-html-sanitizer', '>= 1.4.3'

# This gem is used for build form more easily [https://github.com/heartcombo/simple_form]
gem 'simple_form'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'

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

# Use Sass to process CSS
gem 'sassc-rails'

# Use to build navbar [https://github.com/codeplant/simple-navigation]
gem 'simple-navigation'

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
  gem 'debase', require: false
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 6.0.0.rc1'
  gem 'rubocop', '~> 1.31', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'rubocop-thread_safety', require: false
  gem 'ruby-debug-ide', require: false
  gem 'solargraph', require: false
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem 'rack-mini-profiler'

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem 'spring'
end
