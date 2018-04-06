class SessionsController < ApplicationController
  def new
  end

  def create
    # Username is case insensitive
    user = User.where('lower(username) = ?', params[:session][:username].downcase.strip).first

    if user&.authenticate(params[:session][:password])
      log_in user

      if params[:redirect] == checkout_path
        redirect_to checkout_path
      else
        redirect_to root_path
      end
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
