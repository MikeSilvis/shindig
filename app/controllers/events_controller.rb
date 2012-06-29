class EventsController < ApplicationController
  before_filter :require_login
  before_filter :require_admin, only: [:update]
  caches_action :index, :show
  cache_sweeper :event_sweeper

  def show
    respond_to do |format|
      format.html
      format.json { @event = Event.find(params[:id]) }
    end
  end

  def create
    @event = Event.new(params[:event])
    render status: :created, json: @event if @event.save
  end

  def update

  end

private

  def require_admin
    @event.is_admin?(current_user)
  end

end