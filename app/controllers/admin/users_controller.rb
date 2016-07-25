class Admin::UsersController < Admin::BaseController

  def show
    if @current_user.admin?
      redirect_to admin_path
    else
      redirect_to login_path
    end
  end
end
