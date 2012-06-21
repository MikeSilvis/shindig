class AttendsController < ApplicationController
  before_filter :require_login

  def new
    event = Event.find(params[:event_id])
    event.join_event(current_user.id)
    redirect_to event_path(params[:event_id]), notice: "Congrats on attending"
  end

end