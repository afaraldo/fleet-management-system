Rails.application.routes.draw do
  get 'searcher/search'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  mount SystemSettings::Engine, at: '/system_settings'

  authenticate :user, ->(user) { user.admin? } do
    mount GoodJob::Engine => 'good_job'
  end

  mount Blazer::Engine, at: 'blazer'

  resources :cars
  resources :dash_boards, only: [:index]
  resources :employees
  resources :insurance_plans
  resources :maintenances
  resources :repairs
  resources :suppliers
  resources :users do
    resources :notifications, only: %i[index show destroy]
  end
  resources :work_orders
  resources :work_order_reports

  # Defines the root path route ("/")
  root 'dash_boards#index'
end
