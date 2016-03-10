Rails.application.routes.draw do
  # scope '/admin', module: "admin" do
  #   resources :instruments, param: :name
  # end

  # scope module: "admin" do
  #   resources :instruments, param: :name
  # end

  # namespace "admin" do
  #   resources :instruments
    #This does url, path helper, and controller inheritance
  # end

  resources :instruments do
    resources :books
  end

end
