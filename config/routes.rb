Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  mount SystemSettings::Engine, at: '/system_settings'

  resources :dash_board
  resources :cars
  resources :employees
  resources :users
  resources :work_orders

  # Defines the root path route ("/")
  root 'dash_board#index'
end
