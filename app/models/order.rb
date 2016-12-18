class Order < ActiveRecord::Base
  belongs_to :user
  has_many :purchases

  def total_cost()
    summ = 0.0
    purchases.each do |purchase|
      summ += purchase.amount * purchase.product.price
    end
    return summ
  end
end
