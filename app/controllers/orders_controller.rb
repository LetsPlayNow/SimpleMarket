class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    order_id = params[:id]
    @order = Order.where(user_id: current_user.id, id: order_id).first
  end


  # Fixme can create empty order
  def create
    purchases = current_user.shopping_cart.purchases
    @order = Order.new
    @order.purchases = purchases
    @order.save
    current_user.shopping_cart.purchases.clear
    redirect_to :cart
  end
end
