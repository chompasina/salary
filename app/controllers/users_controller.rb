class UsersController < ApplicationController
  skip_before_action :require_login, only: [:show, :edit]

  def index
    @users = User.all
  end

  def show
    @user = current_user 
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

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "Profile Updated"
      redirect_to current_user
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      render :edit
    end
end

  private

  def user_params
    params.require(:user).permit(:first_name,
                                :last_name,
                                :cohort,
                                :birthdate,
                                :email,
                                :username,
                                :password,
                                :password_confirmation
                                      )
  end
end
