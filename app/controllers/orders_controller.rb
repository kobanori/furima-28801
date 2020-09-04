class OrdersController < ApplicationController
  before_action :move_to_sign_in, only: [:index]
  before_action :set_item, only: [:index]
  before_action :move_to_root, only: [:index]
  

  def index
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
    end
  end
end
