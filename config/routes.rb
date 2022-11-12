Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  mount SystemSettings::Engine, at: '/system_settings'

  resources :cars
  resources :dash_boards, only: [:index]
  resources :employees
  resources :maintenances
  resources :suppliers
  resources :users
  resources :work_orders
  resources :work_order_reports

  # Defines the root path route ("/")
  root 'dash_boards#index'
end
