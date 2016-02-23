class SessionsController < ApplicationController

  def new
  end

  def create
    session[:user_id] = User.find_by(username: params[:session][:username]).id
    redirect_to user_path(current_user)
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
