Rails.application.routes.draw do
  resources :users do
    resources :tools
  end

  namespace 'admin' do
    resources :categories
    resources :users do
      resources :tools
    end
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root to: 'users#index'
end
