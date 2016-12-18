class RemoveStringColumnFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :string
  end
end
