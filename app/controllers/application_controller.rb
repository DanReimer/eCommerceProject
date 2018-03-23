class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  rescue_from CanCan::AccessDenied do |exception|
    access_denied exception
  end

  def access_denied(exception)
    flash[:warning] = exception.message
    redirect_to root_path
  end

  def authenticate_admin_user!
    logged_in? ? current_user.admin : false
  end
end
