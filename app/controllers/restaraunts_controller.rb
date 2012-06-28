class RestarauntsController < ApplicationController
  before_filter :require_login

  def index
    render json: Restaraunt.all
  end

  def search
    render json: Restaraunt.pluck(:name)
  end

  def show
    render json: Restaraunt.find_by_name(params[:id])
  end

end
