class OrdersController < ApplicationController
  def show
    @order = current_order
    @order_items = @order.order_items
  end

  def checkout
    if logged_in?
      @order = current_order
      # Attach logged in user to order
      # This makes the province available to the order
      @order.user_id = session[:user_id]
      @order.save
      @order_items = @order.order_items
    else
      render 'missing_address'
    end
  end
end
