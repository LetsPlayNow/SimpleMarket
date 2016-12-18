class Purchase < ActiveRecord::Base
  belongs_to :order
  belongs_to :shopping_cart
  belongs_to :product
end
