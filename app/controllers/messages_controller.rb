class MessagesController < ApplicationController
  before_filter :require_login

  def index
    render json: Message.where(event_id: params[:event_id]).all
  end

  def create
    Message.create(event_id: params[:event_id], user_id: current_user.id)
  end

end
