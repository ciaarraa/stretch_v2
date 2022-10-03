Rails.application.routes.draw do
  #root to: "items#index"
  #root to: "store#index"
  root to: "store#index"
  #root to: "articles#index"
  
  devise_for :users
  resources :accounts
  resources :items
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  #root "articles#index"
  
  get 'users/:id/items', to: 'items#user_item_index'
  get 'user/new'
  get 'user/create'
  get 'store/index'
end
