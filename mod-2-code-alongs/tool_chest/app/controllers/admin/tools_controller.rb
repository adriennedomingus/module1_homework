class Admin::ToolsController < Admin::BaseController
  def show
    @tool = Tool.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def index
  end

  def new
    @user = User.find(params[:user_id])
    @tool = Tool.new
  end

  def edit
    @user = User.find(params[:user_id])
    @tool = Tool.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @tool = Tool.find(params[:id])
    @tool.update(tool_params)
    redirect_to admin_user_tool_path(@user, @tool)
  end

  def create
    @tool = Tool.new(tool_params)
    @user = User.find(params[:user_id])
    if @tool.save
      @tool.update(user_id: @user.id)
      flash[:notice] = "Tool was successfully created"
      redirect_to admin_user_tool_path(@user, @tool.id)
    else
      flash.now[:error] = @tool.errors.full_messages.join(", ")
      render :new
    end
  end

  private
  def tool_params
    params.require(:tool).permit(:name, :quantity, :price, :category_id)
  end

end
