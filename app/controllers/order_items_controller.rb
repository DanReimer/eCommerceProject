# frozen_string_literal: true

class OrderItemsController < ApplicationController
  before_action :fetch_product_price, only: %i[create update]
  respond_to :html, :js

  def create
    @order = current_order
    @order_item = @order.order_items.new(item_params)

    if @order.save
      session[:order_id] = @order.id
      flash.now[:success] = 'Added item(s) to shopping cart.'
    else
      @order.order_items.delete(@order_item)
      flash.now[:danger] = 'Unable to add item to cart. Please check your order.'
    end
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

  private

  def fetch_product_price
    @product_price = Product.find(item_params[:product_id]).price
  end

  def item_params
    params.require(:order_item).permit(:colour_id, :product_id, :quantity)
  end
end
