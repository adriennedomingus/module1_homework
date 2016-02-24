class ToolsController < ApplicationController

  def index
    @tools = Tool.all
    session[:most_recent_tool] = Tool.where(user_id: session[:user_id]).order(:created_at).last.id
    session[:current_tool_count] = Tool.sum(:quantity)
    session[:current_potential_revenue] = Tool.sum("quantity * price")
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      # @tool.user_id = current_user.id
      @tool.update(user_id: current_user.id)
      flash[:notice] = "Tool was successfully created"
      redirect_to user_tool_path(current_user, @tool.id)
    else
      flash.now[:error] = @tool.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.update(tool_params)
      redirect_to user_tool_path(current_user, @tool)
    else
      render :edit
    end
  end

  def destroy
    Tool.destroy(params[:id])
    redirect_to user_tools_path(current_user)
  end

  private
  def tool_params
    params.require(:tool).permit(:name, :quantity, :price, :category_id)
  end
end
