class ShoppingCartsController < ApplicationController
  before_action :authenticate_user!

  # cart
  def show
    @cart = current_user.shopping_cart
  end

  # add_item/:id
  def add_item
    p params
    @product = Product.find(params[:id])
    amount = Integer(params[:amount])
    if amount <= @product.amount && amount > 0
      purchase = Purchase.new(amount: amount)
      @product.amount -= amount

      purchase.product = @product
      purchase.save
      @product.save

      current_user.shopping_cart.purchases << purchase
      current_user.shopping_cart.save

      notice = {:buy_success => "Successfully added #{amount} #{@product.name} to Cart"}
    else
      notice = {:buy_danger => "Invalid amount of purchase"}
    end

    redirect_to request.referrer, :flash => notice
  end

  #delete_item/:id
  def delete_item
    purchase = Purchase.find(params[:id])
    purchase.product.amount += purchase.amount
    purchase.product.save
    current_user.shopping_cart.purchases.delete(purchase)
    redirect_to controller: :shopping_carts, action: :show
  end
end
