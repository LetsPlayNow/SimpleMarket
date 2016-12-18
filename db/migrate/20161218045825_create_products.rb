class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :image_url
      t.string :string

      t.timestamps null: false
    end
  end
end
