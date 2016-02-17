class TeachersController < ApplicationController
  def index
    render :text => "Teacher index"
  end

  def show
    render :text => "A specific teacher # #{params[:last_name]}"
  end

end
