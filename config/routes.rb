Rails.application.routes.draw do
  mount SystemSettings::Engine, at: '/system_settings'

  get 'dash_board/index'
  resources :cars
  resources :work_orders
  resources :employees
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'dash_board#index'
end
