class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
