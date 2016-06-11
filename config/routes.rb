Rails.application.routes.draw do
  resources :users, :rides, :attractions

  get '/signup' => 'users#new'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  root 'static#index'
end
