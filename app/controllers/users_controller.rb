class UsersController < ApplicationController
  before_action :require_user

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    @user.save

    if @user.errors.any?
      flash[:danger] = "The name '" + @user.username.capitalize + "' has been taken or password does not meet requirements."
      redirect_to new_user_path
    else
      session[:user_id] = @user.id
      redirect_to users_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    @user.update(user_params)

    if @user.errors.any?
      flash[:danger] = "The name '" + @user.username.capitalize + "' has been taken or password does not meet requirements."
      redirect_to edit_user_path(@user)
    else
      redirect_to users_path
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end

end
