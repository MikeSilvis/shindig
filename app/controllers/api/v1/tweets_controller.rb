class Api::V1::TweetsController < ApplicationController
	before_filter :require_login
  caches_page :show

  def show
		render json: current_user.tweeps.order(:username).pluck(:username).map { |t| "@#{t}"}
  end

	def create
		Share.tweet(current_user, params[:content], params[:event_id])
		render json: "submitted"
	end

end