class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new

  end

  def create
    user = User.ci_find('username', params[:username])
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: "Successfully logged in as #{user.username}!"
    else
      flash.now.alert = "User not found"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Successfully logged out"
  end
end