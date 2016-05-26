class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    p @user
    p params[:session][:password]
    if @user.authenticate(params[:session][:password])
      session[:id] = @user.id
      redirect_to products_path
    else
      flash[:danger] = "Incorrect Username or Password"
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
