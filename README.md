# README

This README would normally document whatever steps are necessary to get the
* Podman
  podman version: 4.1.1
  podman-composer version:  1.0.3

* Ruby version
  rvm install 3.0.0
  rvm use 3.0.0
  rvm gemset create fleet-management-system
  rvm use 3.0.0@fleet-management-system

* Node version
  nvm install 18.11
  nvm use --default 18.11

* System dependencies

You need to install libyaml-devel
dnf install libyaml-devel
dnf install postgresql-devel

gem install pg -v 1.4.3 -- --with-pg-lib=/usr/lib64

gem install pg -v 1.4.3 -- --with-pg-config=/usr/pgsql-15/bin/pg_config

You need to install ImageMagick
Use dnf install ImageMagick ImageMagick-devel in RHEL Linux [https://www.linuxcapable.com/how-to-install-imagemagick-on-rocky-linux-8/]
Use apt install imagemagick

bundle install # for dependencies in RoR
yarn install # for dependencies in NodeJS

* Configuration

Create file config/master.key with decrypt credentials.yml.enc

Usage: EDITOR="gedit" bin/rails credentials:edit

Example in credentials_example.yml

* Database creation

podman-compose up/down

This command should initialize a postgresql database and redis database

* Database initialization

rake db:migrate
rake db:seed
rake db:import_cars
rake db:import_employees

* How to run the test suite

rspec

* Services (job queues, cache servers, search engines, etc.)

sidekiq # To start job queues
podman exec -it fleet-management-system_cache_1 redis-cli flushall # clean all data in redis

Nothing

* Deployment instructions

yarn build:css --watch # compiling css
yarn build --watch # compiling js
rails system_settings:load # load system setting to db
rake app:render # Update version number in application
rails s

* Install ImageMagick on Rocky Linux 8
https://www.linuxcapable.com/how-to-install-imagemagick-on-rocky-linux-8/

* Contributing

Contributions to fleet-management-system may be made using GitHub pull requests. You must include accompanying tests, and all tests must pass for any contribution to be considered.

Also use rubocop -f html -o rubocop.html

# Email Preview 
http://localhost:3000/rails/mailers/work_order/pending_work_order_notification.html?locale=es

# fleet-management-system

Demo: https://fleet-management-system.herokuapp.com/
Credentials:
- username: admin@email.com
- password: test123
