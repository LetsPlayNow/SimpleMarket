class AddRefferenceToProduct < ActiveRecord::Migration
  def change
    add_reference :products, :purchase
  end
end
