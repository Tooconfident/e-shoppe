module ApplicationHelper
  def current_user
    if session[:id]
      @user = User.find(session[:id])
    else
      nil
    end
  end

  def logged_in_user
    session[:id] || current_user
  end

  def users_cart
    current_user.carts.find_by(purchased: false)
  end
end
