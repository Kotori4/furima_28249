class TransactionsController < ApplicationController
  before_action :set_item, only: [:new]
  before_action :login_check, only: [:index, :new, :create]
  before_action :check_user, only: [:new]
  before_action :check_purchased, only: [:new]

  def index
    @purchase = TransactionInfo.new
  end
  
  def new
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
    params.permit(:token, :postal_code, :prefecture_id, :city, :address_line, :building_unit, :phone_number, :item_id ).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    @item = Item.find(params[:item_id])
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency:'jpy'
    )
  end
 
  def set_item
    @item = Item.find(params[:item_id])
  end

  def login_check
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def check_user
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def check_purchased
    if @item.purchase
      redirect_to root_path
    end
  end

end



