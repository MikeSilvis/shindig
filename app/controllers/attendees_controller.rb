class AttendeesController < ApplicationController
  before_filter :require_login

  def index
    @attendees = Attendee.find_attendees_except_self(params[:event_id],
                                                     current_user.id)
  end

  def new
    event = Event.find_by_token(params[:event_id])
    event.join_event(current_user.id)
    redirect_to event_path(event.id), notice: "Radical dude, this shindig is going to rock now that you're coming!"
  end

  def show
    @attendee = Attendee.find(params[:id])
  end

  def update
    @attendee = Attendee.find(params[:id])
    @attendee.update_attributes(params[:attendee])
    @attendee
  end

  def current
    @attendee = current_user.attendees.where(event_id: params[:event_id])
    render "attendees/show"
  end

end