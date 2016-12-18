class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    order_id = params[:id]
    @order = Order.where(user_id: current_user.id, id: order_id).first
  end

  def create
    purchases = current_user.shopping_cart.purchases
    if purchases.empty?
      flash[:alert] = "Cart is empty"
    else
      @order = Order.new
      @order.purchases = purchases
      @order.save
      current_user.shopping_cart.purchases.clear
    end
    redirect_to :cart
  end
end
