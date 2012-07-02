class EventsController < ApplicationController

	def show
		@event = Event.find(params[:id])
		session[:redirect_url] = event_path(@event.id)
	end

end
