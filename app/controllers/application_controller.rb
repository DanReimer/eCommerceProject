class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  helper_method :current_order

  rescue_from CanCan::AccessDenied do |exception|
    access_denied exception
  end

  def current_order
    if session[:order_id].nil?
      Order.new(order_state_id: 1)
    else
      @current_order ||= Order.find(session[:order_id])
    end
  end

  def access_denied(exception)
    flash[:warning] = exception.message
    redirect_to root_path
  end
end
