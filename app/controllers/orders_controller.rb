class OrdersController < ApplicationController
  before_action :move_to_sign_in, only: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root, only: [:index]
  def index
    @order = DeliveryOrder.new
  end
  def create
    @order = DeliveryOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render "index"
    end
  end

  private

  def move_to_sign_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def move_to_root
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.order != nil
      redirect_to root_path
    end
  end

  def order_params
    params.permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id] )
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency:'jpy'
    )
  end
end
