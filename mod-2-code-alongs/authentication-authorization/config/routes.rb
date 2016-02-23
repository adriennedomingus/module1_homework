Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  root to: 'users#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
