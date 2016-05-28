class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @cart = @user.carts.create(purchased: false)
      # Sends email to user when user is created.
      session[:id] = @user.id
      flash.now[:success] = "user Added!"
      @user.send_welcome_email
      redirect_to products_path
    else
      flash.now[:danger] = "user has errors!"
      render :new
    end
  end


  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

end
