class Admin::UsersController < Admin::BaseController

  def show
    @users = User.all
    # render "admin/show"
  end
end
