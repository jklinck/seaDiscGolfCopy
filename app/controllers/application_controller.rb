class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_correct_user
    user = User.find(params[:id])

    # New admin attribute in users DB is "xi25R7gpV39nQ"
    redirect_to "/users/#{current_user.id}" if session[:user_type] != "admin" && current_user != user
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

end