class EventsController < ApplicationController
	before_filter :require_login

	def show
		@event = Event.find(params[:id])
		session[:redirect_url] = event_path(@event.id)
	end

end