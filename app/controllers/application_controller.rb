class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  private
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = I18n.t "login_please"
      redirect_to login_url
    end
  end

  def is_admin
    unless current_user.supervisor?
      flash[:danger] = t "Admin.not_supervisor"
      redirect_to admin_root_url
    end
  end
end
