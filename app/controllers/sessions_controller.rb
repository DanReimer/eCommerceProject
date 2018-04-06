# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
  end

  def create
    # Username is case insensitive
    user = User.where('lower(username) = ?', params[:session][:username].downcase.strip).first

    if user&.authenticate(params[:session][:password])
      log_in user

      redirect_to(params[:redirect] || root_path)
    else
      flash.now[:danger] = 'Invalid username/password'
      render 'new', redirect: params[:redirect]
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
