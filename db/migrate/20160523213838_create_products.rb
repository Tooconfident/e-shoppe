class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :img, default: "http://epaper2.mid-day.com/images/no_image_thumb.gif"
      t.string :description
      t.string :name
      t.decimal :price

      t.timestamps null: false
    end
  end
end
