class RenameForeignKeys < ActiveRecord::Migration
  def change
    rename_column :orders, :users_id, :user_id
    rename_column :products, :categories_id, :category_id
    rename_column :purchases, :products_id, :product_id
    rename_column :purchases, :orders_id, :order_id
    rename_column :purchases, :shopping_carts_id, :shopping_cart_id
    rename_column :shopping_carts, :users_id, :user_id

  end
end
