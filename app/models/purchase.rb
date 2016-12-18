class Purchase < ActiveRecord::Base
  belongs_to :order
  belongs_to :shopping_cart
  has_one :product
end
