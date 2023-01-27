Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'splashscreen#index'
  # get 'pages#home'
  # get "index", to: "splashscreen#index", as: "splashscreen"
  get 'pages/home', to: 'pages#home', as: 'home'
end
