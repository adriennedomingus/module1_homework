Rails.application.routes.draw do
  get '/students', to: 'students#index'
  resources :courses
  resources :teachers, :only => [:index, :show], param: :last_name
  root :to => "welcome#index"
end
