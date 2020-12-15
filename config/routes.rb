Rails.application.routes.draw do
  root to: 'pages#home'
  #session routes
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  #admin routes
  get '/admin/properties' => 'admin#property_index'
  post '/admin/properties' => 'admin#property_create'

  get '/admin/properties/new' => 'admin#property_new', as: 'admin_new_property'

  get '/admin/properties/:id/edit' => 'admin#property_edit', as: 'admin_edit_property'
  patch '/admin/properties/:id' => 'admin#property_update', as:'admin_property'
  delete '/admin/properties/:id' => 'admin#property_destroy'

  #user routes - index, create, show, update, destroy
  resources :users
  resources :accounts
  resources :investments
  resources :properties

  #checkout and payment routes
  get '/investments/update/price' => 'investments#update_price', as:'update_price'

  get '/properties/pay/:id' => 'pay#new', as:'new_pay'
  post '/properties/pay/:id' => 'pay#create', as:'pay'

  #switch investment account - only one can be active at a time
  post '/accounts/switch' => 'accounts#switch', as: 'switch_account'


end
