# frozen_string_literal: true

class OrdersController < ApplicationController
  def show
    @order = current_order
    @order_items = @order.order_items
  end

  def checkout
    if logged_in?
      @order_items = current_order.order_items
      redirect_to cart_path if @order_items.empty?

      # Attach logged in user to order
      # This makes the province available to the order
      current_order.user_id = session[:user_id]
      current_order.save
    else
      render 'missing_address'
    end
  end

  # Make order placed and then remove it from session
  def place_order
    current_order.place_order
    current_order.save
    remove_order
  end
end
