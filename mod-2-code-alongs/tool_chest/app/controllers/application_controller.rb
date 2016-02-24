class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :most_recent_tool, :current_tool_summary, :current_user, :current_admin?

  def most_recent_tool
    if session[:most_recent_tool]
      if current_user.tools.count > 0
        Tool.find(session[:most_recent_tool])
      end
    end
  end

  def current_tool_count
    session[:current_tool_count] ||= 0
  end

  def current_tool_summary
    "Current Tool Count: #{current_tool_count}; Current Potential Revenue: $#{session[:current_potential_revenue] / 100.00}"
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end
end
