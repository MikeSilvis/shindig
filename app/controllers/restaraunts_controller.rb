class RestarauntsController < ApplicationController

  def index
    # render json: Restaraunt.pluck(:name).map { |name| "\"#{name}\"" }
    render json: Restaraunt.all
  end

  def search
    render json: Restaraunt.pluck(:name)
  end

  def show
    render json: Restaraunt.find_by_name(params[:id])
  end

end
