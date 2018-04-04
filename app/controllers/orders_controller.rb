class OrdersController < ApplicationController
  def show
    @order = current_order
    @order_items = @order.order_items
  end

  def checkout
  end
end
