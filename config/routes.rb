Rails.application.routes.draw do
  post 'auth/signup',  to: 'users#create'

  delete '/logout',  to: 'sessions#destroy'
  post 'auth/login', to: 'authentication#authenticate'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
