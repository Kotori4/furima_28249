class TransactionsController < ApplicationController
  before_action :login_check, only: [:index, :new, :create]

  def index
    @purchase = TransactionInfo.new
  end
  
  def new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @purchase = TransactionInfo.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      redirect_to new_item_transaction_path(@purchase.item_id)
    end
  end

  private

  def purchase_params
    params.permit(:postal_code, :prefecture_id, :city, :address_line, :building_unit, :phone_number, :item_id ).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    @item = Item.find(params[:item_id])
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency:'jpy'
    )
  end
 

  def login_check
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end



