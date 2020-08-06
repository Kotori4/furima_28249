class ItemsController < ApplicationController

  def index
    @item = Item.all
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def show  
  end

  private

  def item_params
    params.require(:user).permit(:image).merge(user_id: current_user.id)
  end
end
