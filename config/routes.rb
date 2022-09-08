Rails.application.routes.draw do
  root to: "items#show"
  #root to: "articles#index"

  devise_for :users
  resources :accounts
  resources :items
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  #root "articles#index"
end
