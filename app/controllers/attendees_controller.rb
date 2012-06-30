class AttendeesController < ApplicationController

	def new
    @event = Event.find_by_token(params[:event_id])
  end

  def create_attendee
    event = Event.find_by_token(params[:event_id])
    event.join_event(current_user.id)
    redirect_to event_path(event.id), notice: "Radical dude, this shindig is going to rock now that you're coming!"
  end

end