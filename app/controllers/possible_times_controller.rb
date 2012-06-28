class PossibleTimesController < ApplicationController
	before_filter :require_login
	before_filter :require_admin, only: [:destroy]

  def index
    @possible_times = PossibleTime.where(event_id: params[:event_id]).includes(:possible_attendees)
  end

  def show
    @possible_time = PossibleTime.find(params[:id])
  end

  def create
    @possible_time = PossibleTime.create_from_spine(params[:possible_time], params[:event_id])
  end

  def destroy
    @possible_time = PossibleTime.find(params[:id])
    @possible_time.destroy
    head :no_content
  end

private

	def require_admin
		@event = Event.find(params[:event_id])
		@event.is_owner?(current_user)
	end

end
