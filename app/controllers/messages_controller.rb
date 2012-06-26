class MessagesController < ApplicationController
  before_filter :require_login

  def index
    @messages = Message.where(event_id: params[:event_id]).limit(30).all
  end

  def show
    @message = Message.find(params[:id])
  end

  def create
    @message = current_user.messages.create(content: params[:message][:content],
                                            event_id: params[:event_id])
    @message
  end

end
