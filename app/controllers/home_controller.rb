class HomeController < ApplicationController

  def index
    session[:redirect_url] = "/"
  	if cookies[:name] && current_user
  		event = current_user.events.create_from_cookies(cookies)
  		clear_event_cookies
  		redirect_to event_path(event.id), notice: "Rocking start to your shindig. Keep going!"
  	end
  end

  def login_modal
  end

private

	def clear_event_cookies
		cookies.delete :name
		cookies.delete :description
		cookies.delete :street
		cookies.delete :zipcode
	end

end
