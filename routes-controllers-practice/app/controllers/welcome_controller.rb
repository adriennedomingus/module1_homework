class WelcomeController < ApplicationController
  def index
    render :text => "Welcome to the app"
  end
end
