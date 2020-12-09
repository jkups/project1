Rails.application.routes.draw do
  root to: 'pages#home'
  #session routes
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  #user routes - index, create, show, update, destroy
  resources :users
  resources :accounts
  resources :properties

  #checkout and payment routes
  get '/properties/checkout/price' => 'checkout#price', as:'checkout_price'
  get '/properties/checkout/:id' => 'checkout#new', as:'new_checkout'
  post '/properties/checkout/:id' => 'checkout#create', as:'checkout'
  get '/properties/pay/:id' => 'pay#new', as:'new_pay'
  post '/properties/pay/:id' => 'pay#create', as:'pay'

  #switch investment account - only one can be active at a time
  post '/accounts/switch' => 'accounts#switch', as: 'switch_account'


end
