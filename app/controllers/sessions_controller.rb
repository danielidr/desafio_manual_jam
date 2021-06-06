class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Successfully logged in"
    else
      flash.now[:notice] = "Invalid email or password"
      render action: :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "Signed out successfully"
  end
end
