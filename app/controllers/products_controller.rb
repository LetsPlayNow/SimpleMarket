class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    purchase = Purchase.new(amount: 1)
    @product.amount -= 1

    purchase.product = @product
    purchase.save
    @product.save

    current_user.shopping_cart.purchases << purchase
    current_user.shopping_cart.save
    redirect_to controller: :products, action: :show
  end
end
