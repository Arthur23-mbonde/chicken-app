Rails.application.routes.draw do

  get 'cart', to: 'cart#show'
  post 'cart/add'
  post 'cart/remove'

  resources :products
  resources :categories
  resources :races

  resources :farmers

  devise_for :users
  get 'welcomes/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "welcomes#index"

  get "vendeur", to: "welcomes#vendeur"
  get "client", to: "welcomes#client"
  get "list", to: "welcomes#list"

end
