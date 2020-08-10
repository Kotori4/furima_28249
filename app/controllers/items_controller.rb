class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  def show 
    @item = Item.find(params[:id])
  end
  
  def destory
    item = Item.find(params[:id])
    item.destory
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_detail, :item_category_id, :item_condition_id, :covered_shipping_by_id, :ship_from_location_id, :days_til_ship_id, :price).merge(user_id: current_user.id)
  end
end
