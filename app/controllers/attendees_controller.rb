class AttendeesController < ApplicationController
  before_filter :require_login

  def index
    @attendees = Attendee.where(event_id: params[:event_id]).includes(:user).all()
  end

  def new
    event = Event.find(params[:event_id])
    event.join_event(current_user.id)
    redirect_to event_path(params[:event_id]), notice: "Congrats on attending"
  end

  def show
    @attendee = Attendee.find(params[:id])
  end

  def update
    @attendee = Attendee.find(params[:id])
    @attendee.update_attributes(params[:attendee])
    @attendee
  end

  def current_attendee
    @current_attendee = current_user.attendees.where(event_id: params[:event_id])
  end

end