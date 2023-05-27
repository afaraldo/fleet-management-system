require 'sidekiq/web'
require 'sidekiq/cron/web' # https://github.com/sidekiq-cron/sidekiq-cron#web-ui-for-cron-jobs

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  mount SystemSettings::Engine, at: '/system_settings'

  authenticate :user do
    # , lambda { |user| user.admin? } do
    mount Sidekiq::Web => '/sidekiq' # mount Sidekiq::Web in your Rails app
  end

  mount Blazer::Engine, at: 'blazer'

  resources :cars
  resources :dash_boards, only: [:index]
  resources :employees
  resources :insurance_plans
  resources :maintenances
  resources :suppliers
  resources :users do
    resources :notifications, only: %i[index show destroy]
  end
  resources :work_orders
  resources :work_order_reports

  # Defines the root path route ("/")
  root 'dash_boards#index'
end
