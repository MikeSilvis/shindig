class UsersController < ApplicationController
  def show
    @user = User.find_user_and_event_relations(params[:id], params[:event_id])
  end
end
