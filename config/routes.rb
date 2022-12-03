Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  mount SystemSettings::Engine, at: '/system_settings'

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
