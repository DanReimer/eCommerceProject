# frozen_string_literal: true

# User view actions
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize! :read, @user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to P4P's online store, #{@user.username}!"

      redirect_to(params[:redirect] || root_path)
    else
      render 'new', redirect: params[:redirect]
    end
  end

  def edit
    @user = User.find(params[:id])
    authorize! :update, @user
  end

  def update
    @user = User.find(params[:id])
    authorize! :update, @user

    @user.update_attributes(user_params)

    render 'show'
  end

  private

  def user_params
    params.require(:user).permit(:username,
                                 :password,
                                 :password_confirmation,
                                 :street,
                                 :city,
                                 :province_id,
                                 :postal_code)
  end
end
