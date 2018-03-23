class SessionsController < ApplicationController
  def new

  end

  def create
    # Username is case insensitive
    user = User.where('lower(username) = ?', params[:session][:username].downcase).first

    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid username/password'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
