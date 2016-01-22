Rails.application.routes.draw do
  root to: "splash#index"

  #Routes for CRUD for Users
  get "/users", to: "users#index", as: "users"
  get "/signup", to: "users#new", as: "new_user"
  post "/users", to: "users#create", as: "create_user"
  get "/users/:id", to: "users#show", as: "user"
  get "/users/:id/edit", to: "users#edit", as: "edit_user"
  patch "/users/:id", to: "users#update"
  delete "/users/:id", to: "users#destroy"

  #Routes for login form, logging in and logging out
  get "/login", to: "sessions#new", as: "new_session"
  post "/sessions", to: "sessions#create"
  get "/logout", to: "sessions#destroy", as: "destroy_session"

  #Routes for Articles specific to a User
  # get "/users/:id/articles", to: "users#articles_index", as: "user_articles"
  # may have use for later

  #Routes for CRUD for Articles
  get '/articles', to: "articles#index", as: "articles"
  get '/articles/new', to: 'articles#new', as: "new_article"
  post '/articles', to:'articles#create'
  get '/articles/:id', to: 'articles#show', as: "article"
  get '/articles/:id/edit', to: 'articles#edit', as: "edit_article"
  patch '/articles/:id', to: 'articles#update'
  delete '/articles/:id', to: 'articles#destroy'

  #Routes for Cities
  get '/cities', to: "cities#index", as: "cities"   
  get '/cities/:id', to: "cities#show", as: "city"
  get "/cities/:id/articles/new", to: "articles#new", as: "city_new_article"
  post '/cities/:id/articles', to: "articles#create"
end
