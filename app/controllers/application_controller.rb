class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_login
    session[:redirect_url] = request.fullpath
    redirect_to "/users/auth/twitter" unless current_user
  end

end
