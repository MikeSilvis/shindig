class PossibleTimesController < ApplicationController

  def index
    @possible_times = PossibleTime.where(event_id: params[:event_id]).includes(:possible_attendees)
  end

  def show
    @possible_time = PossibleTime.find(params[:id])
  end

  def create
    @possible_time = PossibleTime.create_from_spine(params[:possible_time], params[:event_id])
  end
end
