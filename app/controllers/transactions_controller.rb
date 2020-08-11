class TransactionsController < ApplicationController
  before_action :login_check, only: [:index, :new, :create]

  def index
  end
  
  def new
    @item = Item.find(params[:item_id])
  end
  
  def create
  end

  private
  def purchase_params
    params.require(:transacton).permit(:user_id, :item_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def login_check
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
