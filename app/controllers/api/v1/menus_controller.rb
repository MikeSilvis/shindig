class Api::V1::MenusController < ApplicationController
  before_filter :require_login

  def index
    @menus = Menu.where(event_id: params[:event_id]).includes(:restaraunt)
  end

  def create
    @menu = Menu.create(restaraunt_id: params[:menu][:restaraunt_id],
                        event_id: params[:event_id],
                        name: params[:menu][:name])
    @menu
    render status: :created
  end

  def show
    @menu = Menu.where(id: params[:id]).includes(:restaraunt).first
  end

  def update
    @menu = Menu.find(params[:id])
    @menu.update_attributes(params[:menu])
    @menu
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    head :no_content
  end

private

  def require_admin
    @event = Event.find(params[:event_id])
    @event.is_owner?(current_user)
  end

end