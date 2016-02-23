Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show] do
    resources :tools
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root to: 'users#index'
end
