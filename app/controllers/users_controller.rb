class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update destroy]

  def index
    redirect_to login_users_path unless user_signed_in?
    @users = User.order(id: :asc)
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to users_path
      UserMailer.with(user: @user).update_email.deliver_now if current_user.email != @user.email
    else
      render :edit, status: :bad_request
    end
  end

  def destroy
    @user.destroy

    redirect_to login_users_path, notice: "User Deleted Successfully"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :profile_photo)
  end
end
