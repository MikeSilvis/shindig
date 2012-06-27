class PossibleAttendeesController < ApplicationController
	def create
		pa = params[:possible_attendee][:possible_time_id]
		@possible_attendee = PossibleAttendee.where(possible_time_id: pa,
													 											event_id: params[:event_id],
																		 						user_id: current_user.id)
																								.first_or_create
	  render json: @possible_attendee
	end
end
