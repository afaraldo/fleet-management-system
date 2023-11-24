Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { sessions: 'custom_sessions' }

  authenticate :user, ->(user) { user.superadmin? } do
    mount GoodJob::Engine => 'good_job'
    mount SystemSettings::Engine, at: '/system_settings'
  end

  mount Blazer::Engine, at: 'reports'

  resources :cars
  resources :dash_boards, only: [:index]
  resources :employees
  resources :insurance_plans
  resources :maintenances
  resources :organizations
  resources :repairs
  resources :suppliers
  resources :users do
    resources :notifications, only: %i[index show destroy]
  end
  resources :work_orders
  get 'search', to: 'search#index'
  get 'reports/work_orders'
  get 'searcher/search'

  # Defines the root path route ("/")
  root 'dash_boards#index'
end
