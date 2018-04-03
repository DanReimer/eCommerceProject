class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include OrdersHelper

  rescue_from CanCan::AccessDenied do |exception|
    access_denied exception
  end

  def access_denied(exception)
    flash[:warning] = exception.message
    redirect_to root_path
  end
end
