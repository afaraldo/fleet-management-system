Rails.application.routes.draw do
<<<<<<< HEAD
  #get 'login/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  # get 'login/index'
  # get 'users/index'
  # get 'dash_board/index'
=======
  mount SystemSettings::Engine, at: '/system_settings'

  get 'dash_board/index'
>>>>>>> main
  resources :cars
  resources :work_orders
  resources :employees
  resources :cars
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'dash_board#index'
  #root 'login#index'
end
