class EventsController < ApplicationController
  before_filter :require_login
  before_filter :find_event, only: [:show, :create, :edit, :update, :destroy]
  before_filter :require_admin, only: [:edit, :update]

  def index
    @events = Event.all
  end

  def show
    # @current_attendee = current_user.attendees.where(event_id: @event.id).pluck(:id).first
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      @event
    end
  end

  def edit

  end

  def update

  end

private

  def find_event
    @event = Event.find(params[:id])
  end

  def require_admin
    @event.is_admin?(current_user)
  end

end