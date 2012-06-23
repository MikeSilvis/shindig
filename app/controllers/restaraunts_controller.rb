class RestarauntsController < ApplicationController
  def index
    render json: Restaraunt.all
  end
end
