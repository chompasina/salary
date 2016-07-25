class SessionsController < ApplicationController
  skip_before_action :require_login #, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.admin? && @user.authenticate(params[:session][:password])
      flash[:notice] = "Hi, #{@user.username}. You are now logged in."
      session[:user_id] = @user.id
      redirect_to admin_path
    elsif @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Logged In Successfully"
      redirect_to user_path(@user)
    else
      flash.now[:error] = "Invalid login, try again"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Successfully logged out!"
    redirect_to root_path
  end
end
