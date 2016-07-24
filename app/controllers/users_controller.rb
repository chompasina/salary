class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def index
    @users = User.all
  end

  def show
    @user = current_user #User.find(params[:id]) - switched after making current user in app controller
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new( user_params )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "User sucessfully created. Please log in."
      redirect_to login_path
    else
      flash.now[:error] = @user.errors.full_messages.join(",")
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,
                                :email,
                                :username,
                                :password,
                                :password_confirmation
                                      )
  end
end
