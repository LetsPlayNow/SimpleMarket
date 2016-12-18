class AddRelationships < ActiveRecord::Migration
  def change
    add_reference :purchases, :products, :index => true
    add_reference :purchases, :orders, :index => true
    add_reference :purchases, :shopping_carts, :index => true

    add_reference :products, :categories, :index => true

    add_reference :shopping_carts, :users, :index => true
    add_reference :orders, :users, :index => true
  end
end
