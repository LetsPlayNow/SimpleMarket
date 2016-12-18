class CategoriesController < ApplicationController
  def show
    category_id = params[:id]
    @category = Category.find(category_id)
    @products = @category.products
  end
end
