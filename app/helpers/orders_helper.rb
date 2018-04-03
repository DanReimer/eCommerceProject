module OrdersHelper
  def current_order
    @current_order ||= Order.find_by(id: session[:order_id])

    unless @current_order
      in_progress = Order.in_progress_orders current_user
      if in_progress.size >= 1
        @current_order = in_progress.take
      elsif in_progress.size == 0
        @current_order = Order.new(user: current_user)
      end
      session[:order_id] = @current_order.id
    end
  end
end
