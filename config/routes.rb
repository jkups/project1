Rails.application.routes.draw do
  root to: 'pages#home'
  #session routes
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  #admin routes
  get '/admin/properties' => 'admin_properties#index'
  get '/admin/properties/new' => 'admin_properties#new', as: 'admin_new_property'
  post '/admin/properties' => 'admin_properties#create'

  get '/admin/properties/:id/edit' => 'admin_properties#edit', as: 'admin_edit_property'
  patch '/admin/properties/:id' => 'admin_properties#update', as:'admin_property'
  delete '/admin/properties/:id' => 'admin_properties#destroy'

  get '/admin/investments' => 'admin_investments#index'
  get '/admin/accounts' => 'admin_accounts#index'

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
