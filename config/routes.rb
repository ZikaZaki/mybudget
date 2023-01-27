Rails.application.routes.draw do
  resources :categories
  resources :category_payments
  resources :payments
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'splashscreen#index'
end
