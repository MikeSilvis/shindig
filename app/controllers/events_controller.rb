class EventsController < ApplicationController
  before_filter :require_login
  before_filter :find_event, only: [:show, :create, :edit, :update, :destroy]
  before_filter :require_admin, only: [:edit, :update]

  def index
    render json: Event.all
  end

  def show
    render json: Event.find(params[:id])
  end

  def create
    Event.create(params[:event])
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