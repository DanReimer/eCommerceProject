class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  rescue_from CanCan::AccessDenied do |exception|
    access_denied exception
  end

  def access_denied(exception)
    redirect_to root_path, alert: exception.message
  end

  def authenticate_admin_user!
    logged_in? ? current_user.admin : false
  end

  def current_admin_user

  end
end
