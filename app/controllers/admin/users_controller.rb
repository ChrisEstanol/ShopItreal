class Admin::UsersController < ApplicationController

  layout "admin"

  before_filter :authenticate_user!
  before_filter :admin_only, :except => :show

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless current_user.admin?
      unless @user == current_user
      redirect_to root_path, :alert => "Access denied."
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
    redirect_to admin_users_path, :notice => "User updated."
    else
    redirect_to admin_users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_users_path, :notice => "User deleted."
  end

  private

  def admin_only
    unless current_user.admin?
    redirect_to root_path, :alert => "Access denied."
    end
  end

  def secure_params
    params.require(:user).permit(:role)
  end

end
