class DeliveriesController < ApplicationController
  def create
    @delivery = Delivery.new(delivery_params)
    if @delivery.save
      redirect_to root_path
    else
      redirect_to item_orders_path
    end
  end
end
