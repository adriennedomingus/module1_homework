class ToolsController < ApplicationController

  def index
    @tools = Tool.all
    session[:most_recent_tool] = Tool.order(:created_at).last.id
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
    # @tool = Tool.new(name: params[:tool][:name], quantity: params[:tool][:quantity], price: params[:tool][:price])
    @tool = Tool.new(tool_params)
    if @tool.save
      flash[:notice] = "Tool was successfully created"
      redirect_to tool_path(@tool.id)
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
      redirect_to tool_path(@tool)
    else
      render :edit
    end
  end

  def destroy
    Tool.destroy(params[:id])
    redirect_to tools_path
  end

  private
  def tool_params
    params.require(:tool).permit(:name, :quantity, :price)
  end
end
