class ItemsController < ApplicationController
  before_action :move_to_sign_up, except: [:index, :show, :edit]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_item_show, only: [:edit]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def move_to_sign_up
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :postage_id, :prefecture_id, :set_up_time_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_item_show
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to item_path(@item.id)
    end
  end
end
