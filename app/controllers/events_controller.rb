class EventsController < ApplicationController
	before_filter :require_login, :find_event, :require_attendee

	def show
		@event = Event.find(params[:id])
		session[:redirect_url] = event_path(@event.id)
	end

private

  def find_event
    @event = Event.find(params[:id])
  end

  def require_attendee
    redirect_to root_url, notice: "You were not invited." unless @event.is_attendee?(current_user)
  end

end