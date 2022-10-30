# README

This README would normally document whatever steps are necessary to get the

* Ruby version 
nvm install 12.16.3
rvm install 3.0.0
rvm use 3.0.0
rvm gemset create fleet-management-system
rvm use 3.0.0@fleet-management-system 

* System dependencies

bundle install # for dependencies in RoR
yarn install   # for dependencies in NodeJS

* Configuration

Create file config/master.key with decrypt credentials.yml.enc

* Database creation

podman-compose down/up

* Database initialization

rake db:migrate
rake db:seed

* How to run the test suite

rspec

* Services (job queues, cache servers, search engines, etc.)

Nothing

* Deployment instructions

yarn build:css --watch # compiling css
yarn build --watch # compiling js
rails system_settings:load # load system setting to db
rails s

* Contributing

Contributions to fleet-management-system may be made using GitHub pull requests. You must include accompanying tests, and all tests must pass for any contribution to be considered.

Also use rubocop -f html -o rubocop.html

# fleet-management-system

Demo: https://fleet-management-system-prod.herokuapp.com/
Credentials:
- username: admin@email.com
- password: test123
