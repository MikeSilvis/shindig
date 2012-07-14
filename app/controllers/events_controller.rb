class EventsController < ApplicationController
	before_filter :require_login, :require_attendee

	def show
		session[:redirect_url] = event_path(params[:id])
	end

private

  def require_attendee
    redirect_to root_url, notice: "You were not invited." unless Attendee.is_going_to?(params[:id], current_user.id)
  end

end