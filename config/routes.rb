Rails.application.routes.draw do
  root to: 'pages#home'
  #session routes
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  #user routes - index, create, show, update, destroy
  resources :users
  resources :profiles
  resources :accounts

  post '/accounts/switch' => 'accounts#switch', as: 'switch_account'
end
