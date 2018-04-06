class OrderItemsController < ApplicationController
  # before_action :require_login
  before_action :fetch_product_price, only: [:create, :update]
  respond_to :html, :js

  def create
    @order = current_order
    @order_item = @order.order_items.new(item_params)

    if @order.save
      session[:order_id] = @order.id
      redirect_to cart_path
    else
      flash[:danger] = 'Unable to add item to cart. Please check your order.'
      redirect_to product_path(item_params[:product_id])
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
  
  def require_login
    unless logged_in?
      flash[:warning] = 'Log in to add items to your cart.'
      redirect_to login_path
    end
  end

  def fetch_product_price
    @product_price = Product.find(item_params[:product_id]).price
  end

  def item_params
    params.require(:order_item).permit(:colour_id, :product_id, :quantity)
  end
end
