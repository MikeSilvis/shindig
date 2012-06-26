class AttendeesController < ApplicationController
  before_filter :require_login

  def index
    @attendees = Attendee.where(event_id: params[:event_id]).all()
  end

  def new
    event = Event.find(params[:event_id])
    event.join_event(current_user.id)
    redirect_to event_path(params[:event_id]), notice: "Congrats on attending"
  end

end