class PossibleTimesController < ApplicationController
  def index
    @possible_times =  PossibleTime.find_for(params[:event_id])
  end
  def show
    @possible_time = PossibleTime.find(params[:id])
  end
end
