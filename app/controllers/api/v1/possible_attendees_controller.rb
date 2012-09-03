class Api::V1::PossibleAttendeesController < ApplicationController
	before_filter :require_login

	def show
		@possible_attendee = PossibleAttendee.where(id: params[:id]).includes(:user)
		render json: @possible_attendee
	end

	def create
		pa = params[:possible_attendee][:possible_time_id]
		@possible_attendee = PossibleAttendee.create_for_user(pa, params[:event_id], current_user.id)
	  render json: @possible_attendee, status: :created
	end

	def destroy
		@possible_attendee = PossibleAttendee.setInvisible(params[:id])
		head :no_content
	end

end