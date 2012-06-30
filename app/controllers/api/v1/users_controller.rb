class Api::V1::UsersController < ApplicationController
	before_filter :require_login

  def show
    @user = User.find_user_and_event_relations(params[:id], params[:event_id])
  end

  def current
  	@user = User.find_user_and_event_relations(current_user.id, params[:event_id])
  	render "users/show"
  end

end
