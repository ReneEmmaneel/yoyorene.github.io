Rails.application.routes.draw do
  root "index#index"
  get "/articles", to: "articles#index"
  get "/articles/new", to: "articles#new"
  get "/articles/:id", to: "articles#show"

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#delete'
  get 'welcome', to: 'sessions#welcome'
  get 'delete', to: 'sessions#delete'

  get 'authorized', to: 'sessions#page_requires_login'

  resources :articles
  resources :users, only: [:new, :create, :delete]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
