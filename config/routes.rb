Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  #root route
  root   'login#new'

  # user route start
  get '/users', to: 'users#index'
  get '/users/new' => 'users#new', as: 'new_user'
  post '/users'    => 'users#create', as: 'create_user'
  get  '/users/:id' => 'users#show', as: 'show_user'
  get '/users/:id/edit ' => 'users#edit', as: 'edit_user'
  patch '/users/:id'   => 'users#update', as: 'update_user'
  delete '/users/:id' => 'users#destroy', as: 'delete_user'
  # user route end

  #login routes start
  get    '/login'  => 'login#new'
  post   '/login'  => 'login#create', as: 'login_user'
  get    '/index'  => 'login#welcome'
  get    '/signup/new' => 'login#signupnew', as: 'login_user_signup'
  post    '/signup' => 'login#signupcreate', as: 'create_login_user' 
  delete '/logout' => 'login#delete', as: 'logout_user'
  #login routes end

  #author routes start
  get '/authors' => 'authors#index'
  get '/authors/new' => 'authors#new',  as: 'new_author'
  post '/authors' => 'authors#create',   as: 'create_author'  
  get '/authors/:id' => 'authors#show', as: 'show_author'
  get '/authors/:id/edit' => 'authors#edit', as: 'edit_author'
  patch '/authors/:id' => 'authors#update', as: 'update_author'
  delete '/authors/:id' => 'authors#destroy', as: 'delete_author'
  #author routes end

  #quotes routes start
  get '/authors/:author_id/quotes' => 'quotes#index', as: 'authors_quotes'
  get '/authors/:author_id/quotes/new' => 'quotes#new',  as: 'new_author_quotes'
  post '/authors/:author_id/quotes' => 'quotes#create',  as: 'create_author_quotes' 
  get '/authors/:author_id/quotes/:id' => 'quotes#show', as: 'show_author_quotes'

  get '/authors/:author_id/quotes/:id/edit' => 'quotes#edit', as: 'edit_author_quotes'
  patch '/authors/:author_id/quotes/:id' => 'quotes#update', as: 'update_author_quotes'

  delete '/authors/:author_id/quotes/:id' => 'quotes#destroy', as: 'delete_author_quotes'
  #quotes routes end
end
