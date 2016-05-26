module ApplicationHelper
    def current_user
      @user = User.find(session[:id])
    end

    def logged_in_user
      session[:id] || current_user
    end
end
