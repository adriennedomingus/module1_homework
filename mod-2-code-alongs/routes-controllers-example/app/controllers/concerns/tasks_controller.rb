class TasksController < ApplicationController
  def index
    render :text => "hello!"
  end

  def new
    render :text => "form for a new task"
  end

  def show
    render :text => "here's the individual task #{params[:id]}"
  end

  def edit
    render :text => "here's a form to edit a task #{params[:id]}"
  end
end
