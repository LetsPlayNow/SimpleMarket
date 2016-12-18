class ProductsController < ApplicationController
  def show
    product_id = params[:id]
    @product = Product.find(product_id)
  end

  def add_to_cart
    product_id = params[:id]
    @product = Product.find(product_id)
    purchase = Purchase.new(amount: 1)
    @product.amount -= 1

    purchase.product = @product
    @product.save
    purchase.save

    p purchase
    p purchase.product

    current_user.shopping_cart.purchases << purchase
    current_user.shopping_cart.save
    redirect_to controller: :products, action: :show
  end
end
