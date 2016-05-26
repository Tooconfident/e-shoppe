class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "user Added!"
      session[:id] = @user.id
      redirect_to @user
    else
      flash[:danger] = "user has errors!"
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:img, :name, :description, :price, :quantity)
    end

end
