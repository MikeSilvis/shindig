class Api::V1::AttendeesController < ApplicationController
  before_filter :require_login, only: [:index, :show, :update, :current]
  caches_page :index, :show
  cache_sweeper :attendee_sweeper

  def index
    @attendees = Attendee.find_attendees_except_self(params[:event_id],
                                                     current_user.id)
  end

  def show
    @attendee = Attendee.where(id: params[:id]).includes(:user).first
  end

  def update
    @attendee = Attendee.find(params[:id])
    @attendee.update_attributes(params[:attendee])
    @attendee
  end

  def current
    @attendee = current_user.attendees.where(event_id: params[:event_id])
    render "/api/v1/attendees/show"
  end

end