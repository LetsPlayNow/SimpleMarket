class ShoppingCartsController < ApplicationController
  before_action :authenticate_user!
  def show
    @cart = current_user.shopping_cart
  end

  def update
  end

  def delete_item
    purchase = Purchase.find(params[:id])
    purchase.product.amount += purchase.amount
    purchase.product.save
    current_user.shopping_cart.purchases.delete(purchase)
    redirect_to controller: :shopping_carts, action: :show
  end
end
