Rails.application.routes.draw do
  post 'auth/signup',  to: 'users#create'

  delete '/logout',  to: 'sessions#destroy'
  post 'auth/login', to: 'authentication#authenticate'
  get '/trips', to: 'trips#index'
  post '/trips', to: 'trips#create'
  delete '/trips/:trip_id', to: 'trips#destroy'
  post '/bookings', to: 'bookings#create'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
