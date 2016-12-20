class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders = Order.all
  end

  def show
    order_id = params[:id]

    @order = current_user.orders.find(order_id)
  end

  def create
    purchases = current_user.shopping_cart.purchases
    if purchases.empty?
      flash[:alert] = "Cart is empty"
    else
      @order = Order.new
      @order.purchases = purchases
      @order.user = current_user
      @order.save
      current_user.shopping_cart.purchases.clear
    end
    redirect_to :shopping_carts
  end
end
