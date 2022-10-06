Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  mount SystemSettings::Engine, at: '/system_settings'

  resources :dash_board, only: [:index]
  resources :cars, except: [:show]
  resources :employees, except: [:show]
  resources :users, except: [:show]
  resources :work_orders, except: [:show]

  # Defines the root path route ("/")
  root 'dash_board#index'
end
