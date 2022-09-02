Rails.application.routes.draw do
  devise_for :users
  resources :work_orders
  resources :employees
  resources :cars
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'dash_board#index'
end
