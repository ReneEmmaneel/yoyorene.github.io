Rails.application.routes.draw do
  root "index#index"
  get "/articles", to: "articles#index"
  get "/articles/new", to: "articles#new"
  get "/articles/:id", to: "articles#show"
  get "/articles/delete_article/:id", to: "articles#delete"

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#delete'
  get 'delete', to: 'sessions#delete'

  get 'register', to: 'users#new', :as => :user
  post 'register', to: 'users#create'

  post 'create_account', to: 'users#create'

  get 'authorized', to: 'sessions#page_requires_login'
  get '/users/delete/:id', to: "users#delete"
  get '/users/make_admin/:id', to: "users#make_admin"

  get 'all_users', to: 'users#all_users'

  resources :articles
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
