Rails.application.routes.draw do
  resources :levels, only: [:show] do
    resources :attempts, only: [:new, :create]
  end
end
