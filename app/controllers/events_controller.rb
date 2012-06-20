class EventsController < ApplicationController
  def index
    render json: Event.all
  end

  def show
    render json: Event.find(params[:id])
  end

  def create
    Event.create(params[:event])
  end
end
