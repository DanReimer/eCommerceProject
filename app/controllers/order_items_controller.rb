class OrderItemsController < ApplicationController
  before_action :require_login
  before_action :fetch_product_price

  def create
    @order_item = OrderItem.new(item_params)
    @order_item.order = current_order

    if @order_item.save
      redirect_to order_path(current_order)
    else
      flash[:danger] = 'Unable to add item to cart. Please check your order.'
      redirect_to product_path(item_params[:product_id])
    end
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
