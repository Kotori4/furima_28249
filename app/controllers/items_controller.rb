class ItemsController < ApplicationController

  def index
    @item = Item.all
  end
  
  def new
    @item = Item.new
  end

  def create
    # @item = Item.new(item_params)
    # if @item.save
    #   redirect_to root_path
    # else
    #   render 'new'
    # end
  end

  def edit
  end

  def show  
  end

  private

  # def item_params
  #   params.require(:user).permit(:image, :item_name, :item_detail, :item_category, :item_condition, :covered_shipping_by, :ship_from_location, :days_til_ship, :price).merge(user_id: current_user.id, address_id: current_user.address_id)
  # end
end
