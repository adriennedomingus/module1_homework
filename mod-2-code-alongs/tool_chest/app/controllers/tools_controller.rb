class ToolsController < ApplicationController

  def index
    if params[:user_id].to_i != current_user.id
      render file: '/public/404'
    end
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
    if User.find(params[:user_id]) != current_user
      render file: '/public/404'
    end
  end

  def create
    @tool = Tool.new(tool_params)
    @user = User.find(params[:user_id])
    if @tool.save
      @tool.update(user_id: @user.id)
      flash[:notice] = "Tool was successfully created"
      redirect_to user_tool_path(@user, @tool.id)
    else
      flash.now[:error] = @tool.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @tool = Tool.find(params[:id])
    if @tool.user != current_user
      render file: '/public/404'
    end
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
