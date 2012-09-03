class Api::V1::ItemsController < ApplicationController
  before_filter :require_login

  def index
    @items = Item.where(event_id: params[:event_id]).includes(:user).includes(:category)
  end

  def show
    @item = Item.where(id: params[:id]).includes(:user).includes(:category).first
  end

  def create
    @item = Item.create(event_id: params[:event_id],
                        user_id: current_user.id,
                        name: params[:item][:name],
                        category_id: params[:item][:category_id],
                        quantity: params[:item][:quantity])
    @item
  end
end
