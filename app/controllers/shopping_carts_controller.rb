class ShoppingCartsController < ApplicationController
  def show
    @cart = current_user.shopping_cart
  end

  # TODO
  def edit
  end

  # TODO
  def update
  end
end
