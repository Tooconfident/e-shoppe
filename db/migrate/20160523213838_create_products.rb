class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :img, default: "http://www.flexson.com/media/catalog/product/placeholder/default/No_available_image.gif"
      t.string :description
      t.string :name
      t.decimal :price

      t.timestamps null: false
    end
  end
end
