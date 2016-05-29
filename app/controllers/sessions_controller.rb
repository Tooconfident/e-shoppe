class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if params[:session][:password] != nil
      if @user && @user.authenticate(params[:session][:password])
        session[:id] = @user.id
        redirect_to products_path
      else
        login_error
      end
    else
      login_error
    end
  end

  def destroy
    unless !session[:id]
      reset_session
    end
    redirect_to root_path
  end
end

private
  def login_error
    flash.now[:danger] = "Incorrect Username or Password"
    render 'new'
  end
