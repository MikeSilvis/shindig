class Api::V1::EventsController < ApplicationController

	def show
		@event = Event.find(1)
	end

end
