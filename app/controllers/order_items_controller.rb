class OrderItemsController < ApplicationController
  def create
    @orderItem = OrderItem.create(item_params)
    if @orderItem.save
    else
      redirect_to product_path(item_params[:product_id])
    end
  end

  private

  def item_params
    params.require(:order_item).permit(:order_id, :colour_id, :product_id, :quantity)
  end
end
