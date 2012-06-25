class MenusController < ApplicationController
  def index
    @menus = Menu.find_all_by_event_id(params[:event_id])
  end
end
