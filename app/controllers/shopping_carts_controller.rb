class ShoppingCartsController < ApplicationController
  def show
    @cart = current_user.shopping_cart
  end

  def update
  end

  def delete_item
    current_user.shopping_cart.delete(Purchase.(params[:id]))
    redirect_to controller: :shopping_carts, action: :show
  end
end
