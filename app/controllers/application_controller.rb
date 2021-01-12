class ApplicationController < ActionController::Base
  #before_action :require_login

  private

  def require_login
    unless current_user
      flash.now.alert = "Please log in to continue"
      #redirect_to new_session_path
    end
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
  helper_method :current_user
end
