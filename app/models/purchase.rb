class Purchase < ActiveRecord::Base
  belongs_to :order
  belongs_to :shopping_cart
  has_one :product

  def product=(product)
    self.product_id = product.id
  end

  def product
    return Product.find(self.product_id)
  end
end
