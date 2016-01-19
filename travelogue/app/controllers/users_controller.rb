class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to @user
  end

  def show
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password_digest, :current_city, :profile_photo)
  end

end
