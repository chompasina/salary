class AdminController < ApplicationController

  def show
    if @current_user.admin?
      @current_user
    else
      redirect_to login_path
    end
  end
end
