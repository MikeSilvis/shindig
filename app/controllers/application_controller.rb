class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_login
  	unless current_user
	    session[:redirect_url] = request.fullpath
	    redirect_to "/users/auth/twitter"
	  end
  end

end
