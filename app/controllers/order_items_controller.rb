class OrderItemsController < ApplicationController
  def create
    @order_item = OrderItem.new(item_params)
    @order_item.price_per_item = Product.find(item_params[:product_id]).price
    @order_item.order = current_order
    if @order_item.save
      redirect_to order_path(current_order)
    else
      flash[:danger] = 'Unable to add item to cart. Please check your order.'
      redirect_to product_path(item_params[:product_id])
    end
  end

  private

  def item_params
    params.require(:order_item).permit(:colour_id, :product_id, :quantity)
  end
end
