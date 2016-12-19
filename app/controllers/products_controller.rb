class ProductsController < ApplicationController
  before_action :authenticate_user!, only: :add_to_cart

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
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
      notice = {:buy_error => "Invalid amount of purchase"}
    end

    redirect_to request.referrer, :flash => notice
  end
end
