class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize! :show, @user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to P4P's online store, #{@user.username}!"

      if params[:redirect] == checkout_path
        redirect_to checkout_path
      else
        redirect_to root_path
      end
    else
      render 'new', redirect: params[:redirect]
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :street, :city, :province_id, :postal_code)
  end
end
