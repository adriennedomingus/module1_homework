class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :most_recent_tool, :current_tool_summary

  def most_recent_tool
    Tool.find(session[:most_recent_tool]) || "There are no tools"
  end

  def current_tool_summary
    "Current Tool Count: #{session[:current_tool_count]}; Current Potential Revenue: $#{session[:current_potential_revenue] / 100.00}"
  end
end
