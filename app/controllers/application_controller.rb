class ApplicationController < ActionController::Base
  before_action :require_login, except: [:index, :show]

  private

  def require_login
    unless current_user
      redirect_to new_session_path, alert: 'Please log in to continue'
    end
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
  helper_method :current_user
end
