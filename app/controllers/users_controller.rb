class UsersController < ApplicationController
  before_action :logged_in?, only: [ :edit, :update, :destroy]
  before_action :logged_out?, only: [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    login(@user)
    redirect_to @user
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
    @user = User.find_by_id(params[:id])
    unless current_user == @user
      redirect_to user_path(@user)
      flash[:notice] = "You can't edit that user"
    end
  end

  def update
    @user = User.find_by_id(params[:id])
    if current_user == @user
      if @user.update_attributes(user_params)
        flash[:notice] = "Successfully updated user info"
        redirect_to user_path(@user)
      else
        flash[:error] = @user.error.full_messages.join(", ")
        redirect_to edit_user_path(@user)
      end
    else
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    if current_user == @user
      @user.destroy
      flash[:notice] = "Successfully deleted user #{@user.last_name}"
      redirect_to users_path
    else
      flash[:notice] = "You can't delete that user silly willy."
      redirect_to user_path(@user)
    end
  end

  def articles_index
    @user = User.find(params[:id])
    @articles = @user.articles
  end
  
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :current_city, :profile_photo)
  end

end
