class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :require_login
  require "awesome_print"
  helper_method :current_user
  helper_method :current_admin?
  helper_method :require_login
  

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user?
    current_user
  end

  def current_admin?
    current_user && current_user.admin?
  end

private

  def require_login
        unless current_user?
          flash[:error] = "You must be logged in to access this section"
          redirect_to login_path # halts request cycle
      end
    end
end
