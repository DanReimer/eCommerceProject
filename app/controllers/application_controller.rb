# frozen_string_literal: true

# Provide common methods to child controllers
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
end
