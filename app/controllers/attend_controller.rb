class AttendController < ApplicationController
  def new
    session[:event_token] = params[:id]
    redirect_to "/users/auth/twitter"
  end
end
