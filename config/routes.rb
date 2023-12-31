Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :space_vehicles, only: :index
  resources :rockets, only: [:new, :create]
  resources :space_travels, only: [:index, :new, :create]
end
