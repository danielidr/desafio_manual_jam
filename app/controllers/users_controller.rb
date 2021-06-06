class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @stories = Story.where(user_id: session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :user_id)
  end
end
