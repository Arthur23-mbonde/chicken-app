Rails.application.routes.draw do
  get 'users/show'
  get 'chat_rooms/index'

  get 'cart', to: 'cart#show'
  post 'cart/add'
  post 'cart/remove'

  resources :products do
    scope module: :products do
      resources :purchases, only: [:new] do
        get :success, on: :collection
      end
      resources :payments do
        get :success, on: :collection
        get :cancel, on: :collection
      end
      resources :stripe_checkouts, only: [:create]
    end
  end

  resources :categories
  resources :races
  resources :farmers
  resources :chat_rooms do
    resources :messages
  end

  devise_for :users
  get 'welcomes/index'

  # For turbochat
  devise_scope :user do
    get 'users', to: 'devise/sessions#new'
  end

  get 'user/:id', to: 'users#show', as: 'user'

  ####

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
