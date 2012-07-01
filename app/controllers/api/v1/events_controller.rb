class Api::V1::EventsController < ApplicationController

	def show
		@event = Event.find(params[:id])
	end

end
