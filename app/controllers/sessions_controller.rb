class SessionsController < ApplicationController
  # skip_before_action :require_login #, only: [:new, :create]

  def new
  end

  def create
    # @user = User.find_or_create_by_from_auth_hash(auth_hash)
    # self.current_user = @user
    # redirect_to user_path(@user)
    # # ===========
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Logged In Successfully"
      redirect_to user_path(@user) unless @user.admin?
      redirect_to admin_user_path(@user) if @user.admin?
    else
      flash.now[:error] = "Invalid login, try again"
      render :new
    end
  end
  
  def find_slack_user
  end

  def destroy
    session.clear
    flash[:notice] = "Successfully logged out!"
    redirect_to root_path
  end
  
private

  def auth_hash
    request.env['omniauth.auth']
  end
end
