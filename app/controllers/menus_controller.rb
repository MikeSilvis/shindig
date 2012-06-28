class MenusController < ApplicationController
  before_filter :require_login

  def index
    @menus = Menu.where(event_id: params[:event_id]).order("liked DESC")
  end

  def create
    @menu = Menu.create(restaraunt_id: params[:menu][:restaraunt_id],
                        event_id: params[:event_id],
                        name: params[:menu][:name])
    @menu
    render status: :created
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    @menu.update_attributes(params[:menu])
    @menu
  end

end